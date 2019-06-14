require 'net/http'
require 'json'
module Utilities
  class ApiClient
    include Net

    BASE_URL='https://api.planethoster.net'
    
    def initialize(api_user, api_key)
      @headers = {
        'X_API_USER': api_user,
        'X_API_KEY': api_key,
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
        {code: 405, error: "Method not allowed"}
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
          @req.add_field "#{k}", "#{v}" 
        end

        @res = HTTP.start(@uri.hostname, @uri.port, use_ssl: true) {|http|
          http.request(@req)
        }

        result = JSON.parse(@res.body)
        result[:http_code] = @res.code

        result
      end
  end 
end