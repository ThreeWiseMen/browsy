require 'spec_helper'

describe Element, '#click' do

  subject { object.click }

  let(:object) { described_class.new(name, locator) }
  let(:name) { :global_nav }
  let(:locator) { 'a#one' }

  before :each do
    stub(Browsy.client).click(locator)
  end

  it_behaves_like 'a command method'

  it 'uses selenium to click to the location' do
    subject
    Browsy.client.should have_received.click(locator)
  end

end

