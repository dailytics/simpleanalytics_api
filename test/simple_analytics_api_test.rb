require "test_helper"

class SimpleAnalyticsApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimpleAnalyticsApi::VERSION
  end
end
