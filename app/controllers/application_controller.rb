class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  set_current_tenant_through_filter # Required to opt into this behavior
  before_action :set_tenant

  def set_tenant
    @tenant = Tenant.find_by!(subdomain: request.subdomains.first)
    set_current_tenant(@tenant)
  end  
end
