get "/" do 
	@entries = Entry.all
	erb :"/entries/index"
end

get "/entries/new" do 
	erb :"/entries/new"
end


get '/entries/:id' do
	@entry = Entry.find(params[:id])
	if @entry
		erb :"/entries/show"
	else
		redirect "/"
	end
end

post '/entries' do
	@entry = Entry.new(
		title: params[:title],
		content: params[:content],
		author_id: current_user.id
		)
	if @entry.save
		redirect "/entries/#{@entry.id}"
	else
		@errors = @entry.errors.full_messages
		erb :"/entries/new"
	end
end

post '/entries/:id/comments' do
	@comment = Comment.create(
		content: params[:comment],
		entry_id: params[:id], 
		author_id: current_user.id)
	redirect "/entries/#{params[:id]}"
end