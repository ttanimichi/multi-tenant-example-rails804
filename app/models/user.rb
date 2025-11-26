class User < ApplicationRecord
  include Tenantable

  has_many :posts
  has_many :comments
end
