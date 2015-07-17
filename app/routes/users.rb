get '/users/:id' do
  user = User[params[:id]]
  halt 404 unless user
  json user.to_json
end

post '/users/create/?' do
  params.merge!(JSON.parse(request.body.read))
  status 201
  json User.create_or_update(params).to_json
end
