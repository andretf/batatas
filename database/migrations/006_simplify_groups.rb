require 'sinatra'
require 'sinatra/sequel'

Sequel.migration do
  up do
    #drop_table :user_groups
    #drop_table :groups

    create_table :list_users do
      primary_key :list_users_id
      foreign_key :list_id, :lists
      foreign_key :user_id, :users
      timestamp :created_at, null: false
    end

    alter_table :lists do
      #drop_foreign_key :group_id
      #drop_column :group_id
    end
  end

  down do
    create_table :groups do
      primary_key :id
      String :name
      foreign_key :user_owner_id, :users
      timestamp :created_at, null: false
    end
    create_table :user_groups do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :group_id, :groups
      timestamp :created_at, null: false
    end

    alter_table :lists do
      add_column :group_id
      add_foreign_key :group_id, :groups
    end

    drop_table :lists_users
  end
end
