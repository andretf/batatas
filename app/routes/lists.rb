get '/lists/:id/?' do
  list = List[params[:id]]
  halt 404 unless list
  json list.to_json
end

get '/lists/user/:user_id/?' do
  user_lists = List_User.where(:user_id => params[:user_id])
  halt 404 unless user_lists
  json user_lists.map(&:list_to_json)
end

post '/lists/user/:user_id/?' do
  body = request.body.read
  logger.info ("Request Body: #{body}")
  params.merge!(JSON.parse(body))
  list = List.create(:name => params['name'])
  list.add(params['items']) if params['items']
  List_User.add(:list_id => list.id, :user_id => params['user_id'])

  headers({'Location' => "/lists/#{list.id}"})
  status 201
  json list.to_json
end

delete '/lists/:id' do
  list = List[params[:id]]
  halt 404 unless list

  list.list_users.each(&:destroy)
  list.items.each(&:destroy)
  list.destroy
  ''
end
