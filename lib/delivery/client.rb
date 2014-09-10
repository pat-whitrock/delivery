require 'faraday'

module Delivery
  class Client

    BASE_URL = 'https://api.delivery.com'

    private

    def connection(opts = {})
      opts[:headers] ||= { 'Accept' => 'application/json' }

      Faraday.new(url: BASE_URL) do |faraday|
        faraday.headers = opts[:headers]
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
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
  end
end
