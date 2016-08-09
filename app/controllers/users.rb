
get "/users" do 
end

get "/users/new" do
	erb :"/users/new"
end

post "/users" do
	unless passwords_match?
		redirect "/users/new"
	end	
	@user = User.create(
		username:params[:username],
		email: params[:email],
		password: params[:password])
	if @user.id 
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :"/users/new"
	end
end

get "/users/:id/edit" do 
end

get "/users/:id" do

	@user= User.find(params[:id])

	if @user
		erb :"/users/show"
	else
		redirect "/"
	end
end	

post "/users/:id" do 
end

delete "/users/:id" do 
end
