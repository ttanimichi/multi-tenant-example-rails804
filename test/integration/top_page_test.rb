require "test_helper"

class TopPageTest < ActionDispatch::IntegrationTest
  test "the truth integ" do

    Apartment::Tenant.switch('public') do
      puts "--- In public tenant ---"
      puts "User.pluck(:name): #{User.pluck(:name)}"
    end

    Apartment::Tenant.switch('foo') do
      puts "--- In foo tenant ---"
      puts "User.pluck(:name): #{User.pluck(:name)}"
    end

    get "/"
    assert_response :success
  end
end
