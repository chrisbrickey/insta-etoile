class Api::LikesController < ApplicationController

  #may need to assign likable_type based on the kind of id coming in; for now trying to send that info from front end in ajax request
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id

    if @like.save
      render "api/likes/show"
    else
      render(
        json: @like.errors.full_messages,
        status: 422
      )
    end

  end


  def destroy
    @like = Like.find_by(like_params)

    if @like.destroy
      render "api/likes/show"
    else
      render(
        json: @like.errors.full_messages,
        status: 422
      )
    end

  end


  private

  def like_params
    params.require(:like).permit(:likable_id, :likable_type)
  end
end
