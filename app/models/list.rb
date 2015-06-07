class List < Sequel::Model
  one_to_many :items
  one_to_many :list_users

  def add(items)
    items = [items].flatten
    items.each { |item| add_item(from_json(item)) }
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
  def from_json(item)
    record = Product.get_by_params(item['name'], item['ean_code'])
    options = {product_id: record[:id], amount: item['amount']}
    options[:bought] = item['bought'] if item['bought']
    options
  end
end
