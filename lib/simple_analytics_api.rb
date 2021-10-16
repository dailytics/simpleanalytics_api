require 'json'
require "net/http"
require "uri"
require "cgi"

require 'simple_analytics_api/version'

module SimpleAnalyticsApi
  autoload :Client, "simple_analytics_api/client"
  autoload :Error, "simple_analytics_api/error"

  autoload :Resource, "simple_analytics_api/resource"
  autoload :Object, "simple_analytics_api/object"
end
