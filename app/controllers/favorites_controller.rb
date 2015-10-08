class FavoritesController < ApplicationController
  def create
    fp = FavoriteProject.new
    fp.user = current_user
    fp.project = Project.where(id: params[:project_id]).first
    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end
  
  def destroy
    @favorite_project = FavoriteProject.where(project_id: params[:id],
                                              user_id: current_user.id).
                                        first
    @favorite_project.destroy
    redirect_to dashboard_path
  end
end