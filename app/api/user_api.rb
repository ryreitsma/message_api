class UserAPI < Grape::API
  desc "Get all users"
  get do
    @users = User.all
  
    present @users, with: Entities::User
  end 
  
  desc "Get a user"
  params do
		requires :id, type: Integer, desc: "User id."
	end
  route_param :id do
		get do
      @user = User.find(params[:id])
    end
  end
end
