class SnapsController < ApplicationController

  def index
  end

  def new
    @snap = Snap.new
  end

  def create
   @snap = Snap.new(snap_params)
   if @snap.save
     redirect_to snaps_path
   else
     render 'new'
   end

  end

 private

 def snap_params
   params.require(:snap).permit(:caption, :image)
 end

end
