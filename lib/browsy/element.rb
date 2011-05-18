module Browsy
  class Element

    def initialize(name, *locators)
      @name, @locators = name, locators
    end

    def present?
      @locators.all? { |locator| Browsy.client.is_element_present(locator) } ||
        raise(ElementNotFoundError, "#{self} was not found")
    end

  end
end

