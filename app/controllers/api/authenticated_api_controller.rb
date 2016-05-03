class Api::AuthenticatedApiController < ApplicationController
  def authenticate_token
    authenticate_with_http_token do |token, options|
      authentication = Authentication.find_by(auth_token: token)
      if authentication
        return Person.find(authentication.person_id)
      else
        return nil
      end
    end
  end

  def is_admin
    person = authenticate_token
    unless person && person.role == 'admin'
      render json: { error: 'Bad Token'}, status: 401
      return false
    end
    return true
  end  
end
