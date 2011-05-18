require 'spec_helper'

describe Page, '.page_url' do

  subject { object.page_url }

  let(:object) { Class.new(Page) }

  context 'when url has been set' do
    before(:each) { object.url(url) }
    let(:url)     { 'http://example.org/' }

    it { should == url }
  end

  context 'when url has not been set' do
    specify {
      expect { subject }.
        to raise_error(UrlMissingError, "#{object} must have an URL")
    }
  end

end

