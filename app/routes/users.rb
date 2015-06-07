get '/users/:id' do
  user = User[params[:id]]
  halt 404 unless user
  json user.to_json
end

post '/users/create/?' do
  params.merge!(JSON.parse(request.body.read))
  json User.create_or_update(params).map(&:to_json)
end
