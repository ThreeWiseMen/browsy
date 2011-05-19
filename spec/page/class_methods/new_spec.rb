require 'spec_helper'

describe Page, '.new' do

  subject { object.new }

  let(:object) { Class.new(Page) }

  context 'when url has been set' do
    before(:each) { object.url 'http://example.org/' }

    it { should be_instance_of object }
  end

  context 'when url has not been set' do
    specify {
      expect { subject }.
        to raise_error(UrlMissingError, "#{object} must have an URL")
    }
  end

end

