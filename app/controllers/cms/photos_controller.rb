module Cms
  class PhotosController < Cms::AdminController

    def index
      @photos = Photo.all
    end

    def new
      @photo = Photo.new
    end
    
    def create
      photo = Photo.new(params[:photo])
      if photo.save
    		redirect_to photos_path, :notice => "Successfully created photo"
      else
        flash[:error] = "There was an error creating the photo"
        redirect_to photos_path
      end
    end

    def edit
      @photo = Photo.find(params[:id])
    end

    def update
      photo = Photo.find(params[:id])
      if photo.update_attributes(params[:photo])
    		redirect_to photos_path, :notice => "Successfully updated photo"
      else
        flash[:error] = "There was an error updating the photo"
        render :action => 'edit'
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photos_path
    end


  end
  
end