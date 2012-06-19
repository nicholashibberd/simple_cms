module Cms
  class ImagesController < Cms::AdminController

    def index
      @images = Image.all
    end

    def new
      @image = Image.new
    end
    
    def create
      image = Image.new(params[:image])
      if image.save
    		redirect_to images_path, :notice => "Successfully created image"
      else
        flash[:error] = "There was an error creating the image"
        redirect_to images_path
      end
    end

    def edit
      @image = Image.find(params[:id])
    end

    def update
      image = Image.find(params[:id])
      if image.update_attributes(params[:image])
    		redirect_to images_path, :notice => "Successfully updated image"
      else
        flash[:error] = "There was an error updating the image"
        render :action => 'edit'
      end
    end

    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to images_path
    end


  end
  
end