class Api::CampsController < ApplicationController
  def get
    id = params[:id]
    camp = Camp.find(id)
    render json: camp
  end

  def search
    
  end
end
