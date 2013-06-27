class UserAPI < Grape::API
  desc "Get all users"
  get do
    present User.all, with: Presenters::User
  end

  desc "Get a user"
  params do
    requires :id, type: Integer, desc: "User id."
  end
  get ':id' do
    present User.find(params[:id]), with: Presenters::User
  end
end
