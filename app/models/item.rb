class Item < Sequel::Model
  many_to_one :list
  many_to_one :product

  alias :bought? :bought

  def to_json
    {
      id: id,
      name: product.name,
      ean_code: product.ean_code,
      amount: amount,
      bought: bought,
      listId: list_id
    }
  end

  def buy
    set(bought: true)
    save
  end

  def unbuy
    set(bought: false)
    save
  end
end
