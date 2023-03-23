require 'json'

class FileProcessor
  def initialize(file_ref)
    @file_ref = file_ref
  end

  def write_to_file(data)
    File.new(@file_ref, 'a') unless File.exist?(@file_ref)
    File.write(@file_ref, JSON.dump(data), mode: 'a')
  end

  def read_from_file
    file = File.read(@file_ref)
    data_hash = JSON.parse(file)
    return data_hash if data_hash

    puts 'No record found'
  end
end
