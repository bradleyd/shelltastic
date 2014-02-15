require 'spec_helper'

class Foo
  include ShellTastic::StringUtils
end

describe ShellTastic::StringUtils do
  it "should run a shell command" do
    klass = Foo.new
    klass.string_nil_or_blank?("").should eq(true)
  end

end
