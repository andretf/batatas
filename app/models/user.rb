class User < Sequel::Model
  one_to_many :list_users
  unrestrict_primary_key

  def self.create_or_update(params)
    user = User[params['id']]

    if user.nil?
      user = User.create(:id => params['id'], :name => params['name'])
    elsif user['name'] != params['name']
      user = User.update(:name => params['name'])
    end

    user
  end

  def to_json
    {
        id: id,
        name: name
    }
  end
end
