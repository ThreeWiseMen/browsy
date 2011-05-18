module Browsy

  def self.client
  end

  # Thrown when a page is instantiated without an URL
  class UrlMissingError < StandardError; end

  # Thrown when a page is not found on the page
  class ElementNotFoundError < StandardError; end
end

require 'browsy/page'
require 'browsy/element'

