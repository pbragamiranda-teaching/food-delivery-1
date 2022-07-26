class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  def find(index)
    @room[index]
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row , header_converters: :symbol) do |row|
      #TO DO
    end
  end
end
