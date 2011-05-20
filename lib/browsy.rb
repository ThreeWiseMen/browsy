require 'selenium-webdriver'
require 'selenium/client'

require 'browsy/configuration'
module Browsy

  def self.config
    @configuration ||= Configuration.new('selenium.yml')
  end

  def self.client
    @client ||= Selenium::Client::Driver.new(config.data)
  end

  # Thrown when a page is instantiated without an URL
  class UrlMissingError < StandardError; end

  # Thrown when a page is not found on the page
  class ElementNotFoundError < StandardError; end
end

require 'browsy/components'
require 'browsy/page'
require 'browsy/element'
require 'browsy/link'

