class Api::CampsController < ApplicationController
  def get
    camp = Camp.get(params[:id])
    render json: camp
  end

  def search
    camps = Camp.search(params[:q])
    render json: camps
  end

  def get_by_category
    camps = Camp.get_by_category(params[:c])
    render json: camps
  end
end
