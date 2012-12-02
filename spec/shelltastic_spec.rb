require 'spec_helper'

describe ShellTastic do
  it "should run a shell command" do
    result = ShellTastic::Command.run("ls -l")
    p result
  end

end
