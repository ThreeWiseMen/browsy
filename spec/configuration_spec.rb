require 'spec_helper'

describe Configuration do
  it 'knows the common Selenium settings' do
    config = Configuration.new('selenium.yml')
    config.host.should eq('localhost')
    config.port.should eq(4444)
    config.browser.should eq('*firefox')
  end
end

