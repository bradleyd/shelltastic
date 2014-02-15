module ShellTastic

  module Utils
    # @param [String] str the string the needs to be checked
    # @return [Boolean] 
    def string_nil_or_blank? str
      str !~ /[^[:space:]]/ || str.nil? || str.empty?
    end

    # note the ! it will raise an exception
    # @param [String] str the string the needs to be checked
    # @return [ShellTastic::CommandException] 
    def string_nil_or_blank! str
      # raise if command is empty or nil
      if str !~ /[^[:space:]]/ || str.nil? || str.empty?
        raise ShellTastic::CommandException.new("Command is emtpy or nil")
      end
    end

    # like the other methods but set exception flag 
    def empty_nil_blank(str, raize=false)
      result = (str !~ /[^[:space:]]/ || str.nil? || str.empty?)
      raise ShellTastic::CommandException.new("Command is emtpy or nil") if result and raize
      result
    end

  end
end
