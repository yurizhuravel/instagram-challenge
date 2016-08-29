class SnapsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

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

  def destroy
    @snap = Snap.find(params[:id])
    @snap.destroy
    flash[:notice] = 'Snap deleted successfully'
    redirect_to '/snaps'
  end

 private

 def snap_params
   params.require(:snap).permit(:caption, :image)
 end

end
