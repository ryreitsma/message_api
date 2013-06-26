class MessageAPI < Grape::API
	desc "Get all messages"
	get do
		present Message.where(conversation_id: params[:conversation_id]), with: Presenters::Message
	end
	
	desc "Return a message."
	params do
		requires :id, type: Integer, desc: "Message id."
	end
	route_param :id do
		get do
			present Message.find(params[:id]), Presenters::Message
		end
	end

	desc "Create a message."
	params do
		requires :content, type: String, desc: "Your message"
	end

	post do
		Message.create!({
			user_id: current_user.id,
			conversation_id: params[:conversation_id],
			content: params[:content]
		})
		
		{status: 'OK'}
	end

	desc "Update a message."
	params do
		requires :id, type: String, desc: "Message ID."
		requires :content, type: String, desc: "Your message."
	end
	put ':id' do
		m = Message.find(params[:id])
		m.update_attribute(:content, params[:content])
		m.update_attribute(:conversation_id, params[:conversation_id])
		
		{status: 'OK'}
	end

	desc "Delete a message."
	params do
		requires :id, type: Integer, desc: "Message ID."
	end
	delete ':id' do
		Message.find(params[:id]).destroy
		
		{status: 'OK'}
	end
end
