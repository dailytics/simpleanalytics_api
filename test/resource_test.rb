require "test_helper"

class SimpleAnalyticsResourceTest < Minitest::Test
  def setup
    @client = SimpleAnalyticsApi::Client.new(domain: 'simpleanalytics.com')
  end

  def test_run_with_no_params
    resource = SimpleAnalyticsApi::Resource.new(client: @client)
    assert_equal 'https://simpleanalytics.com/simpleanalytics.com.json?fields=pageviews&version=5',
      resource.url
  end

  def test_run_with_specific_version
    filters = { version: 4 }
    resource = SimpleAnalyticsApi::Resource.new(client: @client, filters: filters)
    assert_equal 'https://simpleanalytics.com/simpleanalytics.com.json?fields=pageviews&version=4',
      resource.url
  end

  def test_run_with_three_fields
    fields = %w(visitors histogram countries)
    resource = SimpleAnalyticsApi::Resource.new(client: @client, fields: fields)
    assert_equal 'https://simpleanalytics.com/simpleanalytics.com.json?fields=visitors,histogram,countries&version=5',
      resource.url
  end

  def test_run_with_two_filters
    filters = { page: '/products/one', start: '2021-01-01' }
    resource = SimpleAnalyticsApi::Resource.new(client: @client, filters: filters)
    assert_equal 'https://simpleanalytics.com/simpleanalytics.com.json?fields=pageviews&page=/products/one&start=2021-01-01&version=5',
      resource.url
  end
end