class InitialStructure < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :address
      t.string :country
      t.timestamps null: false
    end

    create_table :companies do |t|
      t.string :name
      t.timestamps null: false

      t.references :location, index: true, foreign_key: true
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :password
      t.timestamps null: false

      t.references :location, index: true, foreign_key: true
      t.references :company, index: true
    end

    create_table :devices do |t|
      t.string :type
      t.string :token
      t.timestamps null: false

      t.references :user, index: true, foreign_key: true
    end

    create_table :device_scans do |t|
      t.timestamps null: false
      t.references :device, index: true, foreign_key: true
    end
  end

  def self.down
    drop_table :locations
    drop_table :companies
    drop_table :users
  end
end
