# require '../lib/modules/connector'
# include Connector
class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class StdinHandler
#TODO add for those here some tests for those new amazing features
# data = []
  begin
    #TODO add here check if is_integer?
    input = ARGV[0]
    if input.is_integer?
      input = input.to_i
    end

    case input
    when nil
      p "It's a trap!"
    when String
      #TODO here it should got to connector, than to SWAPI API
      # TODO if there lack of internet connection it should also raise sth
      print('It is a string')
      p input
    when Integer
      print('It is an Integer, you should give me a String as an argument')
      p input
    else
      print('It is not a string, you should give me a String as an argument')
    end
  rescue
    raise "Stdin error, non argument in input"
  end
end