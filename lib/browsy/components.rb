module Browsy
  module Components

    def self.included(base)
      base.extend ClassMethods
    end

    def initialize(*)
      self.class.elements_defined_by_page.each { |name, locators|
        elements[name] = Element.new(*locators)
      }
      self.class.links_defined_by_page.each { |name, options|
        links[name] = Link.new(*options.values)
      }
      super
    end

    def elements
      @elements ||= {}
    end

    def links
      @links ||= {}
    end

    module ClassMethods

      def link(name, options)
        links_defined_by_page[name] = options
        define_method("#{name}_link") { links[name] }
        self
      end

      def elements(page_elements)
        page_elements.each { |name, locators| element(name, *locators) }
        self
      end

      def element(name, *locators)
        elements_defined_by_page[name] = locators
        define_method(name) { elements[name] }
        self
      end

      def elements_defined_by_page
        @elements_defined_by_page ||= {}
      end

      def links_defined_by_page
        @links_defined_by_page ||= {}
      end
    end

  end
end

