get '/products/:id/?' do
  product = Product[params[:id]]
  halt 404 unless product
  json product.to_json
end

get '/products/eancodes/:codes/?' do
  product = Product.where(:ean_code => params[:codes].split(','))
  halt 404 unless product
  json product.map(&:to_json)
end

get '/products/names/:names/?' do
  product = Product.where(:name => params[:name].split(',')).map(&:to_json)
  #product = Product.where(:ean_code => [7896079500151,7898909332116]).map(&:to_json)
  halt 404 unless product
  json product.to_json
end

get '/products/?' do
  json Product.all.map(&:to_json)
  #Product.to_json
end

post '/products/?' do
  body = request.body.read
  logger.info ("Request Body: #{body}")
  
  value = JSON.parse(body)

  if value.is_a?(Array)
    value.each {|item| params.merge!(item) }
  else
    params.merge!(value)
  end

  product = Product.create(name: params[:name], ean_code: params[:ean_code])
  headers({'Location' => "/products/#{product.id}"})
  status 201
end
