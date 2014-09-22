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
end

def read_file(file)
my_file = ""
File.open(file,'r') do |f|
  f.each_line {|line| my_file += line}
end
my_file
end

test = HTTPResponseParser.new(read_file('lib/response_200.txt'))
test.response_code