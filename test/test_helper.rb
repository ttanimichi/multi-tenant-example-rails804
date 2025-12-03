ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

Tenant.find_or_create_by(name: 'foo', subdomain: 'foo')

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    Apartment::Tenant.switch!('foo')
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

class ActionDispatch::IntegrationTest
  setup do
    host! "foo.lvh.me"
  end
end
