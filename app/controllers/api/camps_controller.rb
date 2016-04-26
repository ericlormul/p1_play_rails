class Api::CampsController < ApplicationController
  def get
    camp = Camp.get(params[:id])
    render json: camp
  end

  def search
    camps = Camp.search(params[:q])
    render json: camps
  end
end
