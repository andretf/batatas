class User < Sequel::Model
  one_to_many :list_users
  unrestrict_primary_key

  def to_json
    {
        id: id,
        name: name
    }
  end
end
