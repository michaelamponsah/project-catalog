require 'json'

class FileProcessor
  def initialize(file_ref)
    @file_ref = file_ref
  end

  def write_to_file(data_arr)
    return if data_arr.empty?
  
    File.new(@file_ref, 'a') unless File.exist?(@file_ref)
    resource = File.empty?(@file_ref) ? [] : JSON.parse(File.read(@file_ref))
    updated_resource = resource + data_arr
    File.write(@file_ref, JSON.pretty_generate(updated_resource))
  end
 
  def read_from_file
    file = File.read(@file_ref)
    data = JSON.parse(file)
    return 'No record found' if data.empty?
    data
  end
end
