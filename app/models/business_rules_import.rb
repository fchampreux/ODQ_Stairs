class BusinessRulesImport
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
    if imported_business_rules.map(&:valid?).all?
      imported_business_rules.each(&:save!)
      true
    else
      imported_business_rules.each_with_index do |import, index|
        import.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_business_rules
    @imported_business_rules ||= load_imported_business_rules
  end

  def load_imported_business_rules
    #puts open_spreadsheet.nil?
    spreadsheet = self.open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      import = BusinessRule.find_by_id(row["id"]) || BusinessRule.new
      import.attributes = row.to_hash
      puts "test"
      puts import.attributes
      import
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
