require 'spec_helper'

describe Link, '#follow' do

  subject { object.follow }

  let(:object)     { described_class.new(locator, page_class)     }
  let(:locator)    { 'a#one'                                      }
  let(:page_class) { Class.new(Page) { url 'http://example.org' } }


  before :each do
    stub(page_instance).open
    stub(page_class).new { page_instance }
  end
  let(:page_instance) { mock }

  it 'calls #open on the page' do
    subject
    page_instance.should have_received :open
  end
end

