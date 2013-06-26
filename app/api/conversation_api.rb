class ConversationAPI < Grape::API
	desc "Get all conversations"
	get do
		Conversation.all
	end
	
	desc "Return a conversation."
	params do
		requires :id, type: Integer, desc: "Conversation id."
	end
	route_param :id do
		get do
			Conversation.find(params[:id])
		end
	end

	desc "Create a conversation."
	post do
		Conversation.create!({
			user: current_user,
		})
	end

	desc "Delete a conversation."
	params do
		requires :id, type: Integer, desc: "Conversation ID."
	end
	delete ':id' do
		Conversation.find(params[:id]).destroy
	end
end
