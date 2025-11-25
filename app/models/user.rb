class User < ApplicationRecord
  multi_tenant :tenant

  has_many :posts
  has_many :comments
end
