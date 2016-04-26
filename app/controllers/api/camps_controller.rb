class Api::CampsController < ApplicationController
  def get
    id = params[:id]
    camp = Camp.find(id)
    render json: camp
  end

  def search
    camps = Camp.search(params[:q])
    render json: camps
  end
end
