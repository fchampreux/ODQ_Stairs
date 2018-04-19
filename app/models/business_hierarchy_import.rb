class BusinessHierarchyImport
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :file, :playground
  
  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_business_hierarchies.map(&:valid?).all?
      imported_business_hierarchies.each(&:save!)
      true
    else
      imported_business_hierarchies.each_with_index do |column, index|
        column.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_business_hierarchies
    ActiveRecord::Base.connection.execute("DELETE from odq_app.business_hierarchies")
    @imported_business_hierarchies ||= load_imported_business_hierarchies
  end

  def load_imported_business_hierarchies
    #puts open_spreadsheet.nil?
    puts "File load"
    spreadsheet = self.open_spreadsheet(file)
    spreadsheet.default_sheet = 'Combined'
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      record = BusinessHierarchy.new
      record.playground_id = playground
      record.pcf_index = spreadsheet.cell(i,1)
      record.pcf_reference = spreadsheet.cell(i,2)
      record.hierarchical_level = case spreadsheet.cell(i,2).last(2)
          when '.0' then spreadsheet.cell(i,2).count('.')
          else spreadsheet.cell(i,2).count('.')+1
        end

      record.hierarchy = spreadsheet.cell(i,2).gsub('.0','').split('.').inject(playground.to_s) do |result, t|
          result + '.' + t.rjust(3, '0')
        end
      record.name = spreadsheet.cell(i,3)
      record.description = spreadsheet.comment(i,3, spreadsheet.sheets[13])

      record
    end
  end

  def open_spreadsheet(file)
    puts "File Import"
    case File.extname(file.original_filename)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
