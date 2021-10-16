require "test_helper"

class SimpleAnalyticsClientTest < Minitest::Test
  def test_simpleanalytcs_site_is_valid
    client = SimpleAnalyticsApi::Client.new(domain: 'simpleanalytics.com')
    assert client.valid?
  end
end