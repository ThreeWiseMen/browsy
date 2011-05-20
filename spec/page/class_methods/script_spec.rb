require 'spec_helper'

describe Page, '.script' do

  subject { object.script { |page| yields << page } }

  let(:object)          { described_class }
  let(:described_class) { Class.new(Page) { url 'http://example.org' } }
  let(:yields)          { [] }

  before do
    stub(described_class).new { page_instance }
    stub(page_instance).open
  end
  let(:page_instance) { mock }

  it 'creates a new page object' do
    subject
    described_class.should have_received :new
  end

  it 'opens the page' do
    subject
    page_instance.should have_received :open
  end

  # FIXME: WTF is with the nil isn't symbol error?
  # it 'yields the page' do
  #   expect { subject }.to change(yields).
  #     from([]).
  #     to([ page_instance ])
  # end
end

