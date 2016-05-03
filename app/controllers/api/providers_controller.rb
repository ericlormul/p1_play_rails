class Api::ProvidersController < Api::AuthenticatedApiController
  def create
    if !is_admin 
      return
    end
    provider = Provider.create(provider_params)
    provider.create_location(location_params)
    render json: {status: 'created', id: provider.id}, status: 201
  end

  def update
    if !is_admin 
      return
    end
    provider = provider_params
    provider = Provider.update(provider[:id], provider_params)
    provider.location.update(location_params)
    render json: {status: 'updated', id: provider.id}  
  end

  def get
    provider = Provider.get(params[:id])
    location = provider.location
    render json: {provider: provider, location: location}
  end

  def get_all
    render json: Provider.getAll
  end

  private
  def provider_params
    params.require(:provider).permit(:id, :name, :website)
  end

  def location_params
    params.require(:location).permit( :address, :city, :state, :zipcode, :country)    
  end
end
