class AddTenantToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :tenant, foreign_key: true, null: false
  end
end
