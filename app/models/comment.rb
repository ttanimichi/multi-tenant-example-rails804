class Comment < ApplicationRecord
  include Tenantable
  
  belongs_to :post
  belongs_to :user
end
