require '../lib/connector'
# include Connector
class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class StdinHandler
#TODO add for those here some tests for those new features
#   begin
  input = ARGV[0]
  unless input.nil?
    if input.is_integer?
      input = input.to_i
    end
  end

  case input
  when nil
    p "It's a trap!"
  when input.empty?
    p "Please enter name."
  when String
    p input
    Connector.new(input)
  when Integer
    print('It is an Integer, you should give me a String as an argument')
  else
    print('It is not a string, you should give me a String as an argument')
  end

# rescue
#   raise "Stdin error, non argument in input"
# end
end