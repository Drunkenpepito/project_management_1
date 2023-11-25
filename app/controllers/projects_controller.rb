class ProjectsController < ApplicationController
    before_action :set_project, only: %i[ show edit update destroy ]
  
    def index
      @projects = current_group.projects.ordered
    end
  
    def show
    end
  
    def new
      @project = Project.new
    end
  
    def edit
    end
  
    def create
      @project = current_group.projects.build(project_params)
        if @project.save
          respond_to do |format|
            format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
            format.turbo_stream
          end
        else
          render :new, status: :unprocessable_entity
        end
    end
  
    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @project.destroy!
  
      respond_to do |format|
        format.html { redirect_to projects, notice: "Project was successfully destroyed." }
        # format.json { head :no_content }
        format.turbo_stream
  
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = current_group.projects.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name)
      end
  end