class Logger
  class << self
    def log(message)
      p "LOG: #{message}"
    end

    def error(message)
      p "ERROR: #{message}"
    end
  end
end
