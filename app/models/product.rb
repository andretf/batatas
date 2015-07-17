class Product < Sequel::Model
  one_to_many :items

  def self.get_by_params(name, ean_code)
    Product.find_or_create(:name => name, :ean_code => ean_code)
  end

  def to_json
    {
        id: id,
        ean_code: ean_code,
        name: name
    }
  end
end
