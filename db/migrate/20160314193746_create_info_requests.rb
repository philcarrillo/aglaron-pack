class CreateInfoRequests < ActiveRecord::Migration
  def change
    create_table :info_requests do |t|
      t.text :comment
      t.string :company, limit: 50
      t.integer :contact_id
      t.string :contact_method, limit: 25
      t.string :help_required, limit: 25
      t.string :email, limit: 255
      t.string :name_first, limit: 60
      t.string :name_last, limit: 60
      t.string :phone, limit: 20
      t.string :title, limit: 30
      t.timestamps null: false
    end
  end
end
