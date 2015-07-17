post '/lists/:list_id/user/?' do
  params.merge!(JSON.parse(request.body.read))

  sharing = Sharing.where(:list_id => params[:list_id], :user_id => params['id']).first
  if sharing.nil?
    if User[params['id']].nil?
      User.create(:id => params['id'], :name => params['name'])
    end

    sharing = Sharing.create(:list_id => params[:list_id], :user_id => params['id'])
  end

  json sharing.user_id_to_json
end

get '/lists/:list_id/users/?' do
  json Sharing.where(:list_id => params[:list_id]).map(&:user_id_to_json)
end

delete '/lists/:list_id/user/:user_id/?' do
  sharing = Sharing.where(:list_id => params[:list_id], :user_id => params[:user_id])
  halt 404 unless sharing
  sharing.destroy
  ''
end
