class Product < Sequel::Model
  one_to_many :items

  def self.with_name name
    self.first(name: name) || create(name: name)
  end

  def to_json
    {
      id: id,
      name: name,
      ean_code: ean_code
    }
  end
end
