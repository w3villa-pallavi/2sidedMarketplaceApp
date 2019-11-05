class ApplicationController < ActionController::Base
    private

    def after_sign_up_path_for(resource_or_scope)
          edit_runner_path(resource_or_scope.id)
    end
end
