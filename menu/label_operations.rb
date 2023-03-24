require_relative '../classes/file_processor'

class LabelActions
  def initialize
    @label_file_processor = FileProcessor.new('./data_store/label.json')
  end

  def list_labels
    data = @label_file_processor.read_from_file

    if data.empty?
      print "\nYou have no labels in the list\n\n"
      return
    end

    print "\nList of labels\n\n"
    data.each.with_index do |label, index|
      puts "#{index + 1} - Title: #{label['title']}\n    Color: #{label['color']}\n\n"
    end
  end
end
