module Browsy
  class Page
    def self.url(url)
      @url = url
      self
    end

    def self.page_url
      @url || raise(UrlMissingError, "#{self} must have an URL")
    end

    def initialize(*)
      raise UrlMissingError, "#{self} must have an URL" unless self.class.page_url
      super
    end

    def open
      Browsy.client.open(self.class.page_url)
      self
    end
  end
end

