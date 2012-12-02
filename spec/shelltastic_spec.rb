require 'spec_helper'

describe ShellTastic::Command do
  it "should run a shell command" do
    result = ShellTastic::Command("ls -l").run
    p result
  end

end
