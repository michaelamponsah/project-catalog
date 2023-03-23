require_relative '../classes/label'
require_relative '../classes/file_processor'

module LabelData
  def add_label(resource_type, data)
    label_file_processor = FileProcessor.new('./collections/label.json')
    print "Provide #{resource_type}'s label title: "
    title = gets.chomp
    print "Provide #{resource_type}'s label color: "
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(data)

    data_hash = {
      title: label.title,
      color: label.color
    }
    label_file_processor.write_to_file(data_hash)
  end
end
