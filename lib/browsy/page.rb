module Browsy
  class Page
    def self.url(url)
      define_method(:url) { url }
      self
    end

    def self.element(name, *locators)
      elements_defined_by_page[name] = locators
      define_method(name) { elements[name] }
      self
    end

    def self.elements(page_elements)
      page_elements.each { |name, locators| element(name, *locators) }
      self
    end

    def initialize(*)
      raise UrlMissingError, "#{self.class} must have an URL" unless url_set?
      self.class.elements_defined_by_page.each { |name, locators|
        elements[name] = Element.new(*locators)
      }
      super
    end

    def open
      Browsy.client.open(url)
      self
    end

    def elements
      @elements ||= {}
    end

    private

    def url_set?
      self.class.instance_methods.include? :url
    end

    def self.elements_defined_by_page
      @elements_defined_by_page ||= {}
    end
  end
end

