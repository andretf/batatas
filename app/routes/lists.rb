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
  List_User.create(:list_id => list.id, :user_id => params['user_id'])

  headers({'Location' => "/lists/#{list.id}"})
  status 201
  json list.to_json
end

delete '/lists/:id/?' do
  list = List[params[:id]]
  halt 404 unless list

  list.items.each(&:destroy)
  list.destroy
  ''
end


# SHARING

post '/lists/:list_id/user/?' do
  params.merge!(JSON.parse(request.body.read))

  list_user = List_User.where(:list_id => params[:list_id], :user_id => params['id']).first
  if list_user.nil?
    if User[params['id']].nil?
      User.create(:id => params['id'], :name => params['name'])
    end

    list_user = List_User.create(:list_id => params[:list_id], :user_id => params['id'])
  end

  json list_user.user_id_to_json
end

get '/lists/:list_id/users/?' do
  json List_User.where(:list_id => params[:list_id]).map(&:user_id_to_json)
end

delete '/lists/:list_id/user/:user_id/?' do
  list_user = List_User.where(:list_id => params[:list_id], :user_id => params[:user_id])
  halt 404 unless list_user
  list_user.destroy
  ''
end

