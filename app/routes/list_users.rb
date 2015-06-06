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
