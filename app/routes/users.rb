get '/users/:id' do
  user = User[params[:id]]
  halt 404 unless user
  json user.to_json
end

post '/users/create/?' do
  params.merge!(JSON.parse(request.body.read))

  user = User[params['id']]
  if user.nil?
    user = User.create(:id => params['id'], :name => params['name'])
  end

  json user.to_json
end
