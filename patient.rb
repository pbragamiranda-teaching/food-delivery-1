class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attr = {})
    @id = attr[:id]
    # @room
    @name = attr[:name]
    @cured = attr[:cured] || false
    @blood_type = attr[:blood_type]
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end

end

ana = Patient.new(cured: true, name: "Ana")
# p ana.name
# p ana.cured?

conrad = Patient.new(name: "Conrad", blood_type: "A")
# p conrad.cured?
# puts "taking medicines..."
# conrad.cure!

# "---"
# p conrad.cured?
