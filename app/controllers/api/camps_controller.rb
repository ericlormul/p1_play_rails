class Api::CampsController < ApplicationController
  def get_camp
    id = params[:id]
    camp = Camp.find(id)
    render json: camp
  end

  # search method
end
