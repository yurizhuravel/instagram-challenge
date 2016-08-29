class CommentsController < ApplicationController

  def new
    @snap = Snap.find(params[:snap_id])
    @comment = Comment.new
  end

  def create
    @snap = Snap.find(params[:snap_id])
    @snap.comments.create(comment_params)
    if @snap.save
      redirect_to snaps_path
    else
      render 'new'
    end
  end

private

def comment_params
  params.require(:comment).permit(:thoughts)
end

end
