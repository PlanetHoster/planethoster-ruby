require 'net/http'
require 'dotenv/load'
require 'json'

module Utilities
  class ApiClient
    include Net

    BASE_URL = ENV['API_URL'] || 'https://api.planethoster.net'

    def initialize(api_user, api_key)
      @headers = {
        'X-API-USER': api_user,
        'X-API-KEY': api_key,
        'content-type': 'text/json'
      }
      @uri = nil
      @req = nil
      @res = nil
    end

    def call(method, path, params)
      @uri = URI.parse("#{BASE_URL}#{path}")
      case method
      when :get
        get(params)
      when :post
        post(params)
      else
        { code: 405, error: 'Method not allowed' }
      end
    end

    private
    def get(params)
      @uri.query = URI.encode_www_form(params)
      @req = HTTP::Get.new(@uri)
      call!
    end

    def post(params)
      @req = HTTP::Post.new(@uri)
      @req.set_form(params)
      call!
    end

    def call!
      @headers.each do |k, v|
        @req.add_field k.to_s, v.to_s
      end

      @res = HTTP.start(@uri.hostname, @uri.port, use_ssl: true) do |http|
        http.request(@req)
      end

      result = JSON.parse(@res.body)
      result[:http_code] = @res.code

      result
    end
  end
end
