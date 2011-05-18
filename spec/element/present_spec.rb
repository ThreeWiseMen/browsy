require 'spec_helper'

describe Element, '#present?' do
  subject { object.present? }

  let(:object)      { described_class.new(name, *locators) }
  let(:name)        { :global_nav }
  let(:locators)    { [ locator_one, locator_two ] }
  let(:locator_one) { 'a#one' }
  let(:locator_two) { 'a#two' }

  before :each do
    stub(Browsy.client).is_element_present(locator_one) { locator_one_present }
    stub(Browsy.client).is_element_present(locator_two) { locator_two_present }
  end
  let(:locator_one_present) { true }
  let(:locator_two_present) { true }

  it 'checks the page to see if the elements are present' do
    subject
    Browsy.client.should have_received.is_element_present(locator_one)
    Browsy.client.should have_received.is_element_present(locator_two)
  end

  context 'when all locators are found on the page' do
    it { should be_true }
  end

  context 'when a locator is not found on the page' do
    let(:locator_two_present) { false }

    specify {
      expect { subject }.
        to raise_error(ElementNotFoundError, "#{object} was not found")
    }
  end

end

