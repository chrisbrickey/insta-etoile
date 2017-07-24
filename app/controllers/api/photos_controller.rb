class Api::PhotosController < ApplicationController


def index

  #add if else statement that pulls only photos for a certain user if [:id] is in the params

  
  #adjust to be only the photos of people that the curent user is following
  @photos = Photo.all
  # render "api/photos"



end

def show
  @photo = Photo.find(params[:id])
end


def create
  #use below for testing without auth
  # @photo = Photo.create!(photo_params)
  @photo.author_id = current_user.id

  if @photo.save
    render "api/photos/show"
  else
    render(
      json: @photo.errors.full_messages,
      status: 422
    )
  end

end


def update
  #use below for testing without auth
  # @photo = Photo.find(params[:id])
  @photo = current_user.photos.find(params[:id])

  #using update will return true/false depending on whether validations passed
  if @photo.update(photo_params)
    render "api/photos/show"
  else
    render(
      json: @user.errors.full_messages,
      status: 422
    )
  end

end


def destroy
  #use below for testing without auth
  # @photo = Photo.find(params[:id])
  @photo = current_user.photos.find(params[:id])
  @photo.destroy
  render "api/photos/show"
end

private

#must populate author_id internally but listed here so can test during development
def photo_params
  params.require(:photo).permit(
    :photo_url,
    :caption,
    :location,
    :author_id)
end

end
