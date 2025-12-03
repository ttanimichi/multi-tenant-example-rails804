require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth model" do

    puts "--- In user test ---"
    puts "User.pluck(:name): #{User.pluck(:name)}"

    assert User.last.name.present?
  end
end
