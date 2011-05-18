require 'spec_helper'

describe Page, '#open' do

  subject { object.open }

  let(:object) { described_class.new }
  let(:described_class) { Class.new(Page) { url 'http://example.org' } }
  let(:example_url) { 'http://example.org' }

  it_behaves_like 'a command method'

  before do
    stub(Browsy.client).open(example_url)
  end

  it "tells the selenium client to navigate to the page's URL" do
    subject
    Browsy.client.should have_received.open(example_url)
  end

end

