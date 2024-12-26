# frozen_string_literal: true

require "json"
require "csv"
require "find"

def translate_csv(translations_path)
  # Read the translations JSON file
  translations = JSON.parse(File.read(translations_path))

  # Get the directory of the translations file
  dir = File.dirname(translations_path)

  # Find all CSV files in the same directory
  csv_files = Dir.glob(File.join(dir, "*.csv"))

  csv_files.each do |csv_file|
    puts "translating #{csv_file} with #{translations_path}"

    # Read the CSV file with liberal parsing
    csv_content = CSV.read(csv_file, headers: true, liberal_parsing: true)

    # Translate the headers
    translated_headers = csv_content.headers.map { |header| translations[header] || header }

    # Write the translated CSV file
    CSV.open(csv_file, "w", write_headers: true, headers: translated_headers) do |csv|
      csv_content.each do |row|
        csv << row
      end
    end
  end
end

# Find all translations.json files under the schemas/ directory
Find.find("schemas") do |path|
  if File.basename(path) == "translations.json"
    translate_csv(path)
  end
end
