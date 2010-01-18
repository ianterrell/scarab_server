class AddEmailAndOkToEmailFieldsToDevices < ActiveRecord::Migration
  def self.up
    add_column :apn_devices, :email, :string
    add_column :apn_devices, :ok_to_email, :boolean, :default => true
  end

  def self.down
    remove_column :apn_devices, :ok_to_email
    remove_column :apn_devices, :email
  end
end
