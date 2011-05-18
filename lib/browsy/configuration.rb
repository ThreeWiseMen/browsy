require 'yaml'

module Browsy
  class Configuration
    attr_reader :env

    def self.config_path
      File.join(File.dirname(__FILE__), "..", "..", "config")
    end

    def initialize(file_name, env = ENV["BROWSY_ENV"])
      @env = env || "development"
      @data = YAML::load_file(File.join(self.class.config_path, file_name))
      @data[self.env].keys.each { |n| define_accessor_for_name(n) }
    end

    def data
      @data[env]
    end

    private
      def define_accessor_for_name(name)
        instance_eval <<-EOS
          def #{name}
            @data[env]['#{name}']
          end
        EOS
      end
  end
end

