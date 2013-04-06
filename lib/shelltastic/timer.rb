module ShellTastic
  class Timer
      def initialize

      end

      # Creates a start time object
      # @param [nil] 
      # @return [Time] Time now object
      def start
        @start_time = Time.now
      end
      
      # Creates a stop time object
      # @param [nil] 
      # @return [Time] Time now object
      def stop
        @stop_time = Time.now
      end

      # Calculates the total time elapsed
      # @see #start and #stop
      # @param [Hash, nil] opts the opts passed in
      # @option [Boolean] milliseconds the time in milliseconds
      # @return [Time] Time elapsed between #start and #stop
      def total_time(milliseconds = false)
        if milliseconds
          (@stop_time - @start_time) * 1000.0
        else
          @stop_time - @start_time
        end
      end
    end
  end
