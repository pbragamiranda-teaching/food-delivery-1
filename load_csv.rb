require "csv"
require_relative "./patient.rb"

# csv_options = {}

CSV.foreach("./patients.csv", headers: :first_row , header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i
  # row[:name] = row[:name]
  row[:cured] = row[:cured] == "true"
  patient = Patient.new(row)
  p patient
end
