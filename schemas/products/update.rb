# frozen_string_literal: true

require "csv"
require "sqlite3"
require "digest"
require "date"

def update(csv_path, db_path, schema)
  # Open a connection to the SQLite3 database
  db = SQLite3::Database.new(db_path)

  # Read the CSV file
  csv_content = CSV.read(csv_path, headers: true)

  # Init the database with the schema (if it doesn't exist)
  db.execute(schema)

  # Insert CSV data into the products table
  csv_content.each do |row|
    # create a hash of the row fields to use as a unique identifier
    sha = Digest::SHA256.hexdigest(row.fields.join(","))

    # covert the date to an iso8601 string
    date = DateTime.parse(row["date"]).iso8601

    # Prepare the fields for insertion
    fields = row.fields
    fields[csv_content.headers.index("date")] = date

    db.execute <<-SQL, fields + [sha]
      INSERT OR IGNORE INTO products (
        recall_number, warning_number, date, warning_date, recall_heading, product_name, description, hazard_description, consumer_action, original_warning_announcement, remedy_type, units, incidents, remedy, sold_at_label, sold_at, importers, manufacturers, distributors, manufactured_in, custom_label, custom_field, sha
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    SQL
  end

  # Close the database connection
  db.close
end

current_dir = File.dirname(__FILE__)
current_dir_name = File.basename(current_dir)

# fetch the first csv file in the directory
csv_path = Dir["#{current_dir}/*.csv"].first

# fetch the schema
schema = File.read("#{current_dir}/schema.sql")

# Create the database
update(csv_path, "#{current_dir}/#{current_dir_name}.db", schema)
