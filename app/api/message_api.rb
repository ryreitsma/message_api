class MessageAPI < Grape::API
  format :json
  
  http_basic do |username, password|
    password == "toeter"    
  end
  
  resource :users do
    desc "Get all users"
    get do
      @users = User.all
      
      puts "CURRENT USER: #{@current_user.name}"
      present @users, with: Entities::User
    end
  end

  resource :messages do
    desc "Get all messages"
    get do
      Message.all
    end
      
    desc "Return a message."
    params do
      requires :id, type: Integer, desc: "Status id."
    end
    route_param :id do
      get do
        Message.find(params[:id])
      end
    end
    
    desc "Create a message."
    params do
      requires :content, type: String, desc: "Your message"
      end
    post do
      Message.create!({
        user: current_user,
        content: params[:content]
      })
    end

    desc "Update a message."
    params do
      requires :id, type: String, desc: "Message ID."
      requires :content, type: String, desc: "Your message."
    end
    put ':id' do
      Message.find(params[:id]).update_attribute(content: params[:content])
    end

    desc "Delete a message."
    params do
      requires :id, type: Integer, desc: "Message ID."
    end
    delete ':id' do
      Message.find(params[:id]).destroy
    end
  end     
end

