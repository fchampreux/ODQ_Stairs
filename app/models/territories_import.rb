class TerritoriesImport
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_territories.map(&:valid?).all?
      imported_territories.each(&:save!)
      true
    else
      imported_territories.each_with_index do |column, index|
        column.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_territories
    @imported_territories ||= load_imported_territories
  end

  def load_imported_territories
    #puts open_spreadsheet.nil?
    spreadsheet = self.open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      column = Skill.find_by_id(row["id"]) || Skill.new
      column.attributes = row.to_hash
      puts "test"
      puts column.attributes
      column
    end
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ";"})
#    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
