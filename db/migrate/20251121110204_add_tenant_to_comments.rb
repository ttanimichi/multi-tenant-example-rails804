class AddTenantToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :tenant, foreign_key: true, null: false
  end
end
