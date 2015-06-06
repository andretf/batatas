class List_User < Sequel::Model
  many_to_one :list
  many_to_one :user

  def add(list_id, user_id)
    list_user = List_User.where(:list_id => list_id, :user_id => user_id)
    if list_user.nil?
      return List_User.create(:list_id => list_id, :user_id => user_id)
    end
    list_user
  end

  def to_json
    {
      list_id: list_id,
      user_id: user_id,
      list: list.to_json
    }
  end

  def user_id_to_json
    user_id.to_s
  end

  def list_to_json
    list.to_json unless !list
  end
end
