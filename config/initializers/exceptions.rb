ActiveSupport.on_load("fat_free_crm_application_controller") do
  ActionController::Base.class_eval do
    rescue_from FatFreeCrm::Exceptions::MissingSettings,  with: :render_fat_free_crm_exception
    rescue_from FatFreeCrm::Exceptions::ObsoleteSettings, with: :render_fat_free_crm_exception

    private

    def render_fat_free_crm_exception(exception)
      logger.error exception.inspect
      render layout: false, template: "/layouts/500", format: :html, status: 500, locals: { exception: exception }
    end
  end
end
