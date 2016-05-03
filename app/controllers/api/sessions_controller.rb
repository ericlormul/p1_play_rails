class Api::SessionsController < Api::AuthenticatedApiController
  def create
    if !is_admin 
      return
    end
    location = location_params
    session = session_params
    if location.empty?
      session[:location_id] = Program.find(session[:program_id]).provider.location.id
      session = Session.create(session)
    else
      session = Session.create(session)
      session.create_location(location)
    end
    render json: {status: 'created', id: session.id}, status: 201

  end

  def update
    if !is_admin 
      return
    end    
    location = location_params
    session = session_params
    if session[:location_id] == Program.find(session[:program_id]).provider.location.id   
      new_location = Location.create(location);
      Session.update(session[:id], session)
      session = Session.update(session[:id], {location_id: new_location.id})
    else
      session = Session.update(session[:id], session)
      Location.update(session[:location_id], location)
    end
    render json: {status: 'updated', id: session.id}
  end

  def get
    session = Session.get(params[:id])
    location = Location.find(session.location_id)
    render json: {session: session, location: location}
  end

  private
  def session_params
    params.require(:session).permit(:id, :start_date, :end_date, :description, :capacity, :program_id, :location_id, :start_time_of_day, :end_time_of_day, :duration, :price, :prerequisite, :currency_code, :price_details)
  end

  def location_params
    if params[:location].empty?
      {}
    else
      params.require(:location).permit(:address, :city, :state, :zipcode, :country)
    end    
  end
end
