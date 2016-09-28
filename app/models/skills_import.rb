class SkillsImport
  include ActiveModel::Model
  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_skills.map(&:valid?).all?
      imported_skills.each(&:save!)
      true
    else
      imported_skills.each_with_index do |column, index|
        column.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_columns
    @imported_skills ||= load_imported_skills
  end

  def load_imported_skills
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      column = Skill.find_by_id(row["id"]) || Skill.new
      column.attributes = row.to_hash.slice(*Skill.accessible_attributes)
      column
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end