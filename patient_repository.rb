require 'csv'
require_relative "./patient.rb"

class PatientRepository
  attr_reader :patients

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # TODO -> SAVE TO CSV
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row , header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # row[:name] = row[:name]
      row[:cured] = row[:cured] == "true"
      #room_id -> find the room instance with this id
      room = RoomRepository.find(row[:room_id].to_i)
      patient = Patient.new(row)
      # assign the room to the patient
      patient.room = room
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end

repo = PatientRepository.new("./patients.csv")
ana = Patient.new(cured: true, name: "Ana")
conrad = Patient.new(name: "Conrad", blood_type: "A")

repo.add_patient(ana)
repo.add_patient(conrad)

p repo.patients
