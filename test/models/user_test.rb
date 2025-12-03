require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth model" do
    assert User.last.name.present?
  end
end
