class ProjectsController < ApplicationController
    before_action :set_user
  
    def index
      @projects = @user.projects
    end
  
    def show
      @project = @user.projects.find(params[:id])
    end
  
    def new
      @project = @user.projects.build
    end
  
    def create
      @project = @user.projects.build(project_params)
      if @project.save
        redirect_to [@user, @project], notice: 'Project was successfully created.'
      else
        render :new
      end
    end
  
    # ... you can continue with other actions (edit, update, destroy) using the same pattern
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def project_params
      params.require(:project).permit(:title, :description, :image_url, :link)
    end
  end
  