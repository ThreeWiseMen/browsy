module Browsy
  class Page
    include Components

    def self.url(url)
      define_method(:url) { url }
      self
    end

    def self.script
      page = new
      page.open
      yield page
    end

    def initialize(*)
      raise UrlMissingError, "#{self.class} must have an URL" unless url_set?
      super
    end

    def open
      Browsy.client.open(url)
      self
    end

    private

    def url_set?
      self.class.instance_methods.include? :url
    end
  end
end

