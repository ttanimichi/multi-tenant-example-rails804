class Post < ApplicationRecord
  include Tenantable

  belongs_to :user
  has_many :comments
end
