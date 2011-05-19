require 'spec_helper'

describe Page, '.elements' do

  subject { object.elements name => locators }

  let(:object)          { described_class                               }
  let(:described_class) { Class.new(Page) { url 'http://example.org/' } }
  let(:name)            { :header                                       }
  let(:locators)        { [ 'a#one', 'a#two']                           }

  it_behaves_like 'a command method'

  context 'a new Page instance with elements' do
    subject { object.new }

    let(:object) { described_class.elements name => locators }

    its(:header)   { should be_instance_of Element }
  end
end

