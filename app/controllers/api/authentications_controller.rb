class Api::AuthenticationsController < ApplicationController
  #should only be effective on this controller
  skip_before_filter  :verify_authenticity_token

  def authenticate
    authenticate_with_http_basic do |email, password|
      person = Person.find_by(email: email)
      if person && !!person.authenticate(password)
        render json: {auth_token: Authentication.find(person.id).auth_token, nickname: person.nickname, role: person.role}
      else
        render json: {error: 'Incorrect credentials'}, status: 401
      end
    end
  end

  def signup
    params[:person][:role] = 'client'
    person = Person.create(permit_person)
    auth_token = Authentication.find_by(person_id: person.id).auth_token
    render json: {nickname: person.nickname, role: person.role, auth_token: auth_token}
  end

  private
  def permit_person
    params.require(:person).permit(:nickname, :email, :password, :password_confirmation, :role)
  end
end
