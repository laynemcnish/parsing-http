class HTTPResponseParser

  def initialize(file)
    @file = file
  end

  def response_code
    line_array = []
    @file.each_line do |line|
      line_array.push(line)
    end
    line_array[0].split(" ")[1].to_i
  end

  def version
    line_array = []
    @file.each_line do |line|
      line_array.push(line)
    end
    line_array[0].split(" ")[0]
  end

  def body
    @file.split("\n\n")[1].delete("\n")
  end

  def header
    return_hash = {}
    @file.split("\n", 2)[1].split("\n\n")[0].each_line do |line|
      kv_pair = line.split(" ", 2)
      return_hash[kv_pair[0]] = kv_pair[1].delete("\n")
    end
    return_hash
  end

  def content_type
    line_array = []
    @file.each_line do |line|
      line_array.push(line)
    end
    line_array[3].split(" ")[1]
  end

  def server
    line_array = []
    @file.each_line do |line|
      line_array.push(line)
    end
    line_array[1].split(" ", 2)[1].delete("\n")
  end

  def location
    header = self.header
    header["Location:"]
  end

end

def read_file(file)
  my_file = ""
  File.open(file, 'r') do |f|
    f.each_line { |line| my_file += line }
  end
  my_file
end

test = HTTPResponseParser.new(read_file('lib/response_200.txt'))
test.body