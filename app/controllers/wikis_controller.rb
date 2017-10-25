class WikisController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    
    def index
        @wikis = policy_scope(Wiki)
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def new
        @wiki = Wiki.new
        authorize @wiki
    end
    
    def create
        @wiki = Wiki.new
        authorize @wiki
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.user = current_user
        
        if @wiki.save
            flash[:notice] = "Your wiki has been created."
            redirect_to @wiki
        else
           flash[:alert] = "There was an error in creating your wiki."
           render :new
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
        authorize @wiki
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        authorize @wiki
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.user = current_user
        
        @wiki.collaborating_users = User.find(params[:wiki][:collaborating_user_ids])
        @wiki.private = params[:wiki][:private]
        
        if @wiki.save
            flash[:notice] = "Your wiki has been updated."
            redirect_to @wiki
        else
           flash[:alert] = "There was an error in updating your wiki."
           render :new
        end
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        authorize @wiki
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the  wiki."
            render :show
        end
    end
    
    def wiki_params
       params.require(:wiki).permit(:collaborating_users, collaborating_user_ids: []) 
    end
end
