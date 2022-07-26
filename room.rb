require_relative "./patient.rb"

class Room
  attr_reader :patients
  attr_accessor :id

  def initialize(attr = {})
    # @id
    @capacity = attr[:capacity] || 0
    @patients = attr[:patients] || []
  end

  def add_patient(patient)
    if full?
      fail Exception, "Room is full!"
      # raise StandardError, "Room is full!"
    else
      # p "I'm #{self}"
      patient.room = self
      @patients << patient
    end
  end

  def full?
    @capacity == @patients.size
  end

end

# puts "begin - rescue worked!"
ana = Patient.new(cured: true, name: "Ana")
conrad = Patient.new(name: "Conrad", blood_type: "A")
pauline = Patient.new(name: "Pauline")


room_16 = Room.new(capacity: 2)
room_16.add_patient(ana)
room_16.add_patient(conrad)

p room_16.patients.first.name
p room_16.patients.first.room
