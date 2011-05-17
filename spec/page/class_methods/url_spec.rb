require 'spec_helper'

describe Page, '.url' do
  subject { object.url(url) }

  let(:object) { Class.new(Page) }

  context 'when given an URL' do
    let(:url) { 'http://example.org' }
  end

  context 'when given no URL' do
    let(:url) { nil }
  end
end

