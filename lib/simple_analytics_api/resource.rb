module SimpleAnalyticsApi
  class Resource

    BASE_URL = 'https://simpleanalytics.com'

    attr_accessor :client, :fields, :filters, :domain

    def initialize(client:, domain: nil, fields: [], filters: {})
      @client  = client
      @fields  = fields
      @filters = filters
      @domain  = domain || client.domain
      @filters[:version] = 5 unless @filters[:version]
      @fields = [:pageviews] unless @fields.any?
    end

    def fields_and_filters
      fields_and_filters = filters
      fields_and_filters = filters.merge({ fields: fields.join(',') }) if fields.any?
      
      fields_and_filters.sort_by{|k,v| k}.to_h
    end

    def parse_response(body)
      Object.new JSON.parse(body)
    end

    def url
      url = "#{BASE_URL}/#{domain}.json"
      url << "?#{fields_and_filters.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&") }" if fields_and_filters.any?
      url
    end

    def run
      uri = URI.parse url
      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field('Content-Type', 'application/json')
      req.add_field('Api-Key', client.api_key) unless client.api_key.empty?  
      req.add_field('User-Id', client.user_id) unless client.user_id.empty?
    
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true  
      
      response = http.request(req)
      raise SimpleAnalyticsApi::Error.new "Api request failed (#{response.body})" unless response.code == "200"
      raise SimpleAnalyticsApi::Error.new "Api request returned nil (#{response.body})" if response.body.nil?

      parse_response response.body
    end
  end
end