ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

class ActionDispatch::IntegrationTest
  setup do
    puts "--- IntegrationTest setup is called ---"

    Tenant.all.each do |tenant|
      begin
        Apartment::Tenant.create(tenant.subdomain)
      rescue Apartment::TenantExists
      end
    end

    host! "foo.lvh.me"
  end
end
