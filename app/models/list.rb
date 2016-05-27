class List < Sequel::Model
  one_to_many :items
  one_to_many :list_users

  def add (products)
    [products].flatten.each { |product| add_item from_json(product) }
    save
  end

  def to_json
    {
        id: id,
        name: name,
        items: items.map(&:to_json)
    }
  end

  def item(id)
    items.find { |i| i.id == id}
  end

  def empty?
    items.empty?
  end

  private

  def from_json(product)
    options = {
      product_id: Product.find_or_create(:name => product['name'], :ean_code => product['ean_code'])[:id],
      amount: product['amount']
    }
    options[:bought] = product['bought'] if product['bought']

    options
  end
end


