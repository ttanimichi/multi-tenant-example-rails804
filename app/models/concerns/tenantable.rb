module Tenantable
  extend ActiveSupport::Concern

  included do
    default_scope { where(tenant_id: Current.tenant_id) }
  end
end
