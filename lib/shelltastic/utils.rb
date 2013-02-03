module ShellTastic

  module Utils
    # A dirty string check for nil empty or just whitespace
    # @param [String] str the string the needs to be checked
    # @return [Boolean, nil] true if str is empty, nil, or just whitespace
    def string_nil_or_blank? str
      # raise if command is empty or nil
      if str !~ /[^[:space:]]/ || str.nil? || str.empty?
        raise ShellTastic::CommandException.new("Command is emtpy or nil")
      end
    end


  end

end
