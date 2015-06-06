require 'sinatra'
require 'sinatra/sequel'

Sequel.migration do
  up do
    create_table :markets do
      primary_key :id
      text :name, null: false
      BigDecimal :latitude, :size=>[10, 6]
      BigDecimal :longitude, :size=>[10, 6]
      timestamp :created_at, null: false
    end
    create_table :market_products do
      primary_key :id
      foreign_key :market_id, null: false
      foreign_key :product_id, null: false
      Integer :price
      foreign_key :userstamp
      timestamp :created_at, null: false
    end

    create_table :users do
      primary_key :id
      String :email, null: false
      String :name
      Fixnum :points, :default=>0
      timestamp :created_at, null: false
    end
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

    alter_table :items do
      set_column_type :amount, Float
      add_column :price_unit, Integer
    end
    alter_table :lists do
      add_foreign_key :group_id, :groups
    end
    alter_table :products do
      add_column :ean_code, String
    end
  end

  down do
    set_column_type :items, :amount, Fixnum
    drop_column :items, :price_unit
    drop_foreign_key :lists, :group_id
    drop_column :products, :numeric_barcode

    drop_table :market_products
    drop_table :markets
    drop_table :user_groups
    drop_table :users
    drop_table :groups
  end
end
