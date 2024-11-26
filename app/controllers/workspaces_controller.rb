class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[ show edit update destroy switch_to]

  # GET /workspaces or /workspaces.json
  def index
    @workspaces = Workspace.all
  end

  # GET /workspaces/1 or /workspaces/1.json
  def show
  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces or /workspaces.json
  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = Current.user
    respond_to do |format|
      if @workspace.save
        set_current_workspace(@workspace)
        format.html { redirect_to root_url }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workspaces/1 or /workspaces/1.json
  def update
    @workspace.update(workspace_params)
    respond_to do |format|
      if @workspace.update(workspace_params)
      format.html { redirect_to root_url }
       # format.html { render partial: "workspaces/update" }
        #render 'update'
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
      # if turbo_frame_request?
      #   render partial: "some_turbo_frame_partial"
      # else
      #   render partial: "some_other_partial"
      # end
    end
  end

  # DELETE /workspaces/1 or /workspaces/1.json
  def destroy
    @workspace.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, status: :see_other, notice: "Workspace was successfully destroyed." }
    end
  end

  def switch_to
    set_current_workspace(@workspace)
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Current.user.workspaces.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workspace_params
      params.expect(workspace: [ :title ])
    end
end
