class RenameEmail < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.rename :email, :email_address
    end
    change_table :info_requests do |t|
      t.rename :email, :email_address
    end
  end
end
