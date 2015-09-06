get '/' do
	erb :"index"
end



# diplay login form
get "/users/login" do
	@user = User.new
	if request.xhr?
		erb :"users/login", layout: false
	else
		erb :"users/login"
	end
end


# Find user, login, start session
post "/users/login" do

	@login = params[:login]
	@user = User.find_by(login: @login)

	if(@user && @user.password == params[:password])
		auth_login(@user)
		redirect "/users/#{@user.id}"
	else
		@form_error = 'Unable to login'
		erb :"users/login"
	end

end



get "/users/logout" do
	auth_logout
	redirect "/"
end


# display form for creating new user
get "/users/new" do
	@user = User.new
	if request.xhr?
		erb :"users/new", layout: false
	else
		erb :"users/new"
	end
end


# create a new user
post "/users/new" do
	@user = User.new
	@user.login = params[:login]
	@password = params[:password]
	@user.password = @password
	@confirm = params[:confirm]

	if confirm_password(@password, @confirm) == false
		@form_error = 'Confirm password again'
		erb :"users/new"
	end

	if @user.save
		auth_login(@user)
		redirect "/users/#{@user.id}"
	else
		@form_error = 'Unable to register you'
		erb :"users/new"
	end

end




# display user page, display map, options, and time
get "/users/:user_id" do
	@user = User.find(params[:user_id])

	erb :"users/show"
end


# return html form for editing user
get "/users/:user_id/edit" do
	@user = User.find(params[:user_id])
	erb :"users/edit"
end


# update user
post "/users/:user_id" do
	@user = User.find(params[:user_id])
	@user.update_attributes(
		login: params[:login],
		password: params[:password]
	)

	redirect "/users/#{@user.id}"
end

