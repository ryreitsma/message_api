class API < Grape::API
  format :json
  
  http_basic do |username, password|
    password == "toeter"    
  end
  
  helpers do
    def current_user
      @user ||= User.find_by_name(env['REMOTE_USER'])
    end
  end

  resource :conversations do
    mount ConversationAPI => '/'
    segment '/:conversation_id' do
      resource :messages do
        mount MessageAPI => '/'
      end
    end
  end
  
  resource :users do
    mount UserAPI => '/'
  end
end
