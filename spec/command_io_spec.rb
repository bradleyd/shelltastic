require 'spec_helper'

describe ShellTastic::IO do

  it "should return a command result" do
    p ShellTastic::IO.popen("ls -la")
  end
end


