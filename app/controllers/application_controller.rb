class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # prepend_before_action :set_tenant_id
  # 現状、prepend しなくても問題なく動作する
  before_action :set_tenant_id

  def set_tenant_id
    Current.tenant_id = Tenant.find_by!(subdomain: request.subdomains.first).id
  end
end
