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
end
