
# list all directions of a user

get "/users/:user_id/directions" do
	@user = User.find(params[:user_id])
  @directions = @user.directions

	erb :'directions/index'
end



# make new direction, associate data from api request

post "/users/:user_id/directions" do
	@user = User.find(params[:user_id])
  @direction = @user.directions.create

  @origin = Origin.create(address: params[:origin])
  @destination = Destination.create(address: params[:destination])
  @mode = params[:mode]

# dir.origin is possible
  @origin.directions << @direction
  @destination.directions << @direction


  direction_client = DirectionsClient.new


  @distance = direction_client.make_api_request(
                origin: @origin.address, 
                destination: @destination.address, 
                mode: @mode)[:distance]
	@duration = direction_client.make_api_request(
                origin: @origin.address, 
                destination: @destination.address, 
                mode: @mode)[:duration]

  @direction.distance = @distance
  @direction.duration = @duration


  if @direction.save
    erb :"directions/show"
  else
    @form_error = "Unable to save direction"
    redirect "/users/#{@user.id}/directions"
  end

end












