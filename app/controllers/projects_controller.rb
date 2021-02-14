class ProjectsController < ApplicationController
       http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23'
       before_action :set_project, only: [:show, :edit, :update, :destroy]

       def index
              @projects = Project.all
              @q = Project.ransack(params[:q])
              @busqueda = Project.statuses.map
              @projects = @q.result(distinct: true)
       end

       def new
              @project = Project.new
       end

       def create
              @project = Project.new(projects_params)
              if @project.save
                     redirect_to root_path notice: "Proyecto creado de forma éxitosa"
              else
                     redirect_to projects_new_path notice: "El proyecto no pudo ser generado, por favor intentar nuevamente"
              end
       end

       def edit
       end

       def destroy
              @project.destroy
              redirect_to root_path
       end

       def update
              @project.update(projects_params)
              redirect_to root_path
       end

       def show
       end

       private
              def projects_params
                     params.require(:project).permit(:name, :description, :started_date, :finished_date, :status)
              end

              def set_project
                     @project = Project.find(params[:id])
              end
end