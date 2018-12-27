class ResourcesController < ApplicationController
    before_action :load_user

    def load_user
        @user = current_user
    end

    def index
        @resources = @user.present? ?  @user.resources : Resource.all
    end

    def show
        @user = current_user
        @resource = @user.resources.find(params[:id])
    end

    def edit
        @user = current_user
        @resource = @user.resources.find(params[:id])
    end

    def new
        @user = current_user
        @resource = @user.resources.build
    end

    def create
        @user = current_user
        @resource = @user.resources.create(resource_params)
        puts resource_params
        redirect_to resources_path
    end

    def update
        @user = current_user
        @resource = Resource.find(params[:id])

        if @resouce.update(resource_params)
            redirect_to resources_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @user = current_user
        @resource = @user.resources.find(params[:id])
        @resource.destroy

        redirect_back fallback_location: root_path
    end

    private

    def resource_params
        params.require(:resource).permit(:title, :url, :pdf)
    end
end
