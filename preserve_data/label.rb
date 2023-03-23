require_relative '../classes/label'
require_relative '../classes/file_processor'

module LabelData
  @@label_arr = []

  def add_label(resource_type, data)
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

    @@label_arr << data_hash
  end

  def persist_label_data
    label_file_processor = FileProcessor.new('./data_store/label.json')
    label_file_processor.write_to_file(@@label_arr)
  end
end
