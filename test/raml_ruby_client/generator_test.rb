require 'minitest_helper'

describe RamlRubyClient::Generator do

  it "should has a version number" do
    refute_nil ::RamlRubyClient::Generator::VERSION
  end

end
