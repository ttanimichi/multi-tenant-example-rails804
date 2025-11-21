class AddTenantToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :tenant, foreign_key: true, null: false
  end
end
