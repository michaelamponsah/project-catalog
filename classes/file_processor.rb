require 'json'

class FileProcessor
  def initialize(file_ref)
    @file_ref = file_ref
  end

  def write_to_file(data)
    File.new(@file_ref, 'w') unless File.exist?(@file_ref)
    resource = File.empty?(@file_ref)? [] : JSON.parse( File.read(@file_ref))
    resource << data
    File.write(@file_ref, JSON.dump(resource), mode: 'w')
  end

  def read_from_file
    file = File.read(@file_ref)
    data = JSON.parse(file)
    return 'No record found' if data.empty?

    data
  end
end
