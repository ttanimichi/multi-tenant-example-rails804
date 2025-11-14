class Tenant < ApplicationRecord
  after_create :create_tenant
  after_destroy :drop_tenant

  private

  def create_tenant
    Apartment::Tenant.create(self.subdomain)    
  end

  # NOTE: 危険なので実装すべきでないかも
  # 当面、drop はエンジニア作業でするのが良いかも
  def drop_tenant
    # Apartment::Tenant.drop(self.subdomain)
  end
end
