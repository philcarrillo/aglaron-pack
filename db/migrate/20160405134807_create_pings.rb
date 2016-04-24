class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.text :msg, limit: 100
      t.text :msg_type, limit: 20
      t.integer :mod_count, default: 0
      t.timestamps null: false
    end
  end
end
