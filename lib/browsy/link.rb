module Browsy
  class Link
    def initialize(locator, page_class)
      @locator, @page_class = locator, page_class
    end

    def follow
      page = @page_class.new
      page.open
    end
  end
end

