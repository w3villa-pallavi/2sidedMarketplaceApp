class ApplicationController < ActionController::Base
    private

    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :runner
          new_runner_session_path
        elsif resource_or_scope == :admin
          new_admin_session_path
        else
          root_path
        end
    end
end
