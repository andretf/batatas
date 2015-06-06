class Item < Sequel::Model
  many_to_one :list
  many_to_one :product

  alias :bought? :bought

  def to_json
    {
        id: id,
        listId: list_id,
        ean_code: product.ean_code,
        name: product.name,
        amount: amount,
        bought: bought
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
