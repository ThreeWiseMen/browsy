require 'spec_helper'

describe Page, '.url' do

  subject { object.url(url) }

  let(:object) { Class.new(Page) }
  let(:url)    { 'http://example.org/' }

  it_behaves_like 'a command method'

end

