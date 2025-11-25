class Post < ApplicationRecord
  multi_tenant :tenant

  belongs_to :user
  has_many :comments
end
