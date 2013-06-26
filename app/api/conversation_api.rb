class ConversationAPI < Grape::API
	desc "Get all conversations"
	get do
		present Conversation.all, with: Presenters::Conversation
	end
	
	desc "Return a conversation."
	params do
		requires :id, type: Integer, desc: "Conversation id."
	end
	route_param :id do
		get do
      present Conversation.find(params[:id]), with: Presenters::Conversation
		end
	end

	desc "Create a conversation."
	post do
		Conversation.create!({
			user_id: current_user.id,
		})
		
		{status: 'OK'}
	end

	desc "Delete a conversation."
	params do
		requires :id, type: Integer, desc: "Conversation ID."
	end
	delete ':id' do
		Conversation.find(params[:id]).destroy
		
		{status: 'OK'}
	end
	
	segment '/:conversation_id' do
    resource :messages do
      mount MessageAPI => '/'
    end
  end
end
