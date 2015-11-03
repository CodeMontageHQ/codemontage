class BetaSignupsController < ApplicationController
  def create
    bsu = BetaSignup.new
    bsu.user = current_user

    respond_to do |format|
      format.json { render json: bsu.save.to_json }
    end
  end
end
