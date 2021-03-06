module Browsy
  class Element

    def initialize(*locators)
      @locators = locators
    end

    def present?
      @locators.all? { |locator| Browsy.client.is_element_present(locator) } ||
        raise(ElementNotFoundError, "#{self} was not found")
    end

    def click
      @locators.each { |locator| Browsy.client.click(locator) }
      self
    end

  end
end

