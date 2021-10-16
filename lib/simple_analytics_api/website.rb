module SimpleAnalyticsApi
  class Website < Resource

    attr_accessor :client

    def initialize(client:)
      @client  = client
    end

    def url
      "#{BASE_URL}/api/websites"
    end

  end
end