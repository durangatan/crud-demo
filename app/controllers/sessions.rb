
before do
	@errors = []
end

get "/sessions" do 
end

get "/sessions/new" do 
	erb :"/sessions/new"
end

post "/sessions" do
	@user = User.find_by(email:params[:email])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors << "Invalid Credentials"
		erb :"/sessions/new"
	end
end


get "/sessions/:id/edit" do 
end

get "/sessions/:id" do
	
end	

post "/sessions/:id" do 
end

delete "/sessions" do
	session[:user_id] = nil
	redirect "/" 
end