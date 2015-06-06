class Product < Sequel::Model
  one_to_many :items

  def to_json
    {
        id: id,
        ean_code: ean_code,
        name: name
    }
  end
end
