class Comment < ApplicationRecord
  multi_tenant :tenant

  belongs_to :post
  belongs_to :user
end
