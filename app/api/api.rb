class API < Grape::API
  format :json
  
  http_basic do |username, password|
    password == "toeter"    
  end
  
  helpers do
    def current_user
      @user ||= User.find_by_email(request.env['REMOTE_USER'])
    end
  end

  resource :conversations do
    mount ConversationAPI => '/'    
  end
  
  resource :users do
    mount UserAPI => '/'
  end
end
