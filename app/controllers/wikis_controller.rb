class WikisController < ApplicationController
    def index
        @wikis = Wiki.all
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new
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
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.user = current_user
        
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
 
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the  wiki."
            render :show
        end
    end
end