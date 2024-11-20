module Workspacable
  extend ActiveSupport::Concern
  included do
    before_action :ensure_workspace
  end


  def ensure_workspace
    if authenticated?
      unless current_workspace
        Current.workspace = if Current.user.workspaces.any?
          Current.user.workspaces.first
        else
          Current.user.workspaces.create(title: "Пространство")
        end
        session[:cw_id] = Current.workspace.id
      end
    end
  end

  def workspace_from_session
    if session[:cw_id]
      Current.user.workspaces.find_by(id: session[:cw_id])
    end
  end

  def current_workspace
    Current.workspace ||= workspace_from_session
  end

  def set_current_workspace(workspace)
     Current.workspace
     session[:cw_id] = Current.workspace.id
  end
end
