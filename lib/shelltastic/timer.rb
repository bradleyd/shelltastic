module ShellTastic
  module Timer
    class << self
      # Creates a start time object
      # @param [nil] 
      # @return [Time] Time now object
      def start
        @start = Time.now
      end
      
      # Creates a stop time object
      # @param [nil] 
      # @return [Time] Time now object
      def stop
        @stop = Time.now
      end

      # Calculates the total time elapsed
      # @see #start and #stop
      # @param [Hash, nil] opts the opts passed in
      # @option [Boolean] milliseconds the time in milliseconds
      # @return [Time] Time elapsed between #start and #stop
      def total_time(:milliseconds = false)
        if opts[:milliseconds]
          (@stop - @start) * 1000.0
        else
          @stop - @start
        end
      end
    end
  end
end
