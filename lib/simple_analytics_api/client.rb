# frozen_string_literal: true

module SimpleAnalyticsApi
  class Client

    attr_accessor :api_key, :user_id, :domain

    def initialize(api_key: nil, user_id: nil, domain: nil)
      @api_key = api_key.to_s
      @user_id = user_id.to_s
      @domain  = domain.to_s
    end

    def valid?
      run.ok rescue false
    end

    def websites 
      Website.new(client: self).run
    end

    def run(fields: [], filters: {})
      Resource.new(client: self, fields: fields, filters: filters).run
    end
  end
end