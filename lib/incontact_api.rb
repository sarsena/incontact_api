require 'httparty'
require 'faraday'
require 'base64'
require 'json'

module InContactApi
  class Connection
    class << self
      def setup
        conn = Faraday.new(:url => Configs.url) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end

      def authorization
        response = setup.post do |req|
          req.url '/InContactAuthorizationServer/Token'
          req.headers["accept-encoding"] = "none"
          req.headers["Content-Type"]  = "application/json; charset=utf-8"
          req.headers["Authorization"] = "basic #{Configs.key}"
          req.body = Configs.request_body
        end
        result = JSON.parse(response.body)
        token = result["access_token"]

        {:uri => result["resource_server_base_uri"], :token => token}
      end

      def base
        api_conn = Faraday.new(:url => authorization[:uri]) do |faraday|
          faraday.headers["accept-encoding"] = "none"
          faraday.headers["Authorization"] = "bearer #{authorization[:token]}"
          faraday.headers["Content-Type"]  ="application/x-www-form-urlencoded"
          faraday.headers["Data-Type"] = "json"
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end

  class Configs
    class << self
      def url
        ENV["UCN_URL"]
      end

      def key
        Base64.encode64(ENV["UCN_KEY"]).gsub("\n", "")
      end

      def request_body
        body = {
          grant_type: ENV["GRANT_TYPE"],
          username: ENV["USERNAME"],
          password: ENV["PASSWORD"],
          scope: ENV["SCOPE"]
        }.to_json
        body.to_s
      end
    end
  end
end
