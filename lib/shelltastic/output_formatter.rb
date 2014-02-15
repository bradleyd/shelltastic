module ShellTastic
  class OutputFormatter
    attr_accessor :output, :pid, :error, 
      :command, :start, :stop,
      :total_time, :exitstatus

    def build(args)
      args.each_pair do |key, value|
        send("#{key}=",value)
      end
    end

    def inspect
      hsh = {}
      meths =  self.class.instance_methods(false)  - [:build, :inspect]
      meths.each do |meth|
        if meth !~ /=/
          hsh.store(meth.to_sym,self.method(meth).call)
        end
      end
      hsh
    end
  end
end
