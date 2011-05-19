require 'spec_helper'

describe Page, '.link' do

  subject { object.link name, :locator => locator, :page => page_class }

  let(:object)           { described_class                               }
  let(:described_class)  { Class.new(Page) { url 'http://example.org/' } }

  let(:name)             { :home                                         }
  let(:locator)          { 'a#home'                                      }
  let(:page_class)       { Class.new(Page) { url 'http://example.org/' } }
  let(:link_method_name) { "#{name}_link".intern                         }

  it_behaves_like 'a command method'

  its(:instance_methods) { should include link_method_name }

  context 'a new Page instance with a link' do
    subject { object.new }

    let(:object) { described_class.link name, :locator => locator, :page => page_class }

    its(:home_link) { should be_instance_of Link }
    its(:links)     { should have_key :home }
  end
end

