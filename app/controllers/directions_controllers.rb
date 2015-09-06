get "/users/:user_id/directions" do
	@user = User.find(params[:user_id])
	@directions = Direction.all

	erb :'directions/index'
end

# make new direction, associate data from api request
post "/users/:user_id/directions" do
	@user = User.find(params[:user_id])
	@direction = Direction.new
  @origin = Origin.create(address: params[:origin])
  @destination = Destination.create(address: params[:destination])
  @mode = params[:mode]

  @direction.origin = @origin
  @direction.destination = @destination

  direction_client = DirectionsClient.new



  @distance = direction_client.make_api_request(
                origin: @origin.address, 
                destination: @destination.address, 
                mode: @mode)[:distance]
	@duration = direction_client.make_api_request(
                origin: @origin.address, 
                destination: @destination.address, 
                mode: @mode)[:duration]


  if @direction.save
    erb :"directions/show"
  else
    @form_error = "Unable to save direction"
    redirect "/users/#{@user.id}/directions"
  end

end












