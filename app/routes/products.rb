get '/products/:id/?' do
  product = Product[params[:id]]
  halt 404 unless product
  json product.to_json
end

get '/products/?' do
  json Product.all.map(&:to_json)
end

post '/products/?' do
  body = request.body.read
  logger.info ("Request Body: #{body}")
  JSON.parse(body).each {|product| params.merge!(product) }
  product = Product.create(name: params['name'], ean_code: params['ean_code'])
  headers({'Location' => "/products/#{product.id}"})
  status 201
end

get '/products/eancodes/:codes/?' do
  product = Product.where(:ean_code => params[:codes].split(','))
  halt 404 unless product
  json product.map(&:to_json)
end


