module ShellTastic
  module Timer
    class << self
      def start
        @start = Time.now
      end

      def stop
        @stop = Time.now
      end

      def total_time(opt={})
        if opt[:milli]
        (@stop - @start) * 1000.0
        else
          @stop - @start
        end
      end
    end
  end
end
