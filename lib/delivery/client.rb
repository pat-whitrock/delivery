require 'faraday'

module Delivery
  class Client
    BASE_URL = 'https://api.delivery.com'

    def initialize(options={})
      merged_options = Delivery.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    private

    def connection(opts = {})
      opts[:headers] ||= { 'Accept' => 'application/json' }

      Faraday.new(url: BASE_URL) do |faraday|
        faraday.authorization :Bearer, token
        faraday.headers = opts[:headers]
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path, params)
      request(:get, path, params)
    end

    def post(path, params)
      request(:post, path, params)
    end

    def put(path, params)
      request(:put, path, params)
    end

    def request(method, path, params = {})
      connection.send(method, path) do |request|
        request.body = params if [:post, :put].include? method
      end
    end

    def token
      @token ||= Delivery::Token.new(client_id: client_id, principle: principle).token
    end
  end
end
