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

    def self.link(name, options)
      links_defined_by_page[name] = options
      define_method("#{name}_link") { links[name] }
      self
    end

    def initialize(*)
      raise UrlMissingError, "#{self.class} must have an URL" unless url_set?
      self.class.elements_defined_by_page.each { |name, locators|
        elements[name] = Element.new(*locators)
      }
      self.class.links_defined_by_page.each { |name, options|
        links[name] = Link.new(*options.values)
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

    def links
      @links ||= {}
    end

    private

    def url_set?
      self.class.instance_methods.include? :url
    end

    def self.elements_defined_by_page
      @elements_defined_by_page ||= {}
    end

    def self.links_defined_by_page
      @links_defined_by_page ||= {}
    end
  end
end

