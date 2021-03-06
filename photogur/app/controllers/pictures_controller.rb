class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  def show 
    begin
      @picture = Picture.find(params[:id])
    rescue
      render "404"
    end
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else
      render :new
    end
  end
  
  def edit 
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      flash[:notice] = "Please enter info"
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])      #find user selected id in Picture array and assign to @picture
    @picture.destroy                          #destroy @picture 
    redirect_to pictures_url                  #redirect to pictures_url  (ruby helper)
  end


  private 
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end
  