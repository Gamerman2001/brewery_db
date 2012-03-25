require 'faraday'

module BreweryDB
  class Client
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      config
    end

    def connection
      Faraday.new(url: config.endpoint) do |builder|
        builder.adapter(config.adapter)
      end
    end
  end
end