require "test_helper"

class TopPageTest < ActionDispatch::IntegrationTest
  test "the truth integ" do
    puts "Tenant.pluck(:name): #{Tenant.pluck(:name)}"
    puts "User.pluck(:name): #{User.pluck(:name)}"
    puts "Apartment.tenant_names: #{Apartment.tenant_names}"

    get "/"
    assert_response :success
  end
end
