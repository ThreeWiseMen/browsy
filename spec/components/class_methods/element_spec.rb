require 'spec_helper'

describe Components, '.element' do

  subject { object.element element_name, *locators }

  let(:object)          { described_class                  }
  let(:described_class) { Class.new { include Components } }
  let(:element_name)    { :header                          }
  let(:locators)        { ['div#header']                   }

  it_behaves_like 'a command method'

  its(:instance_methods) { should include element_name }

  context 'a new Page instance with an element' do
    subject { object.new }

    let(:object) { described_class.element element_name, *locators }

    its(:header)   { should be_instance_of Element }
    its(:elements) { should have_key :header }
  end

end

