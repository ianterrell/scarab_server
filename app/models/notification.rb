class Notification < ActiveRecord::Base
  validates_presence_of :alert, :badge
  validates_length_of :alert, :within => 3..150
  validates_numericality_of :badge
  
  after_save :send_to_all_active_devices
  
protected
  
  def send_to_all_active_devices
    APN::Device.active.find_each do |device|
      notification = APN::Notification.create :device => device, :alert => self.alert, :sound => self.sound, :badge => self.badge
    end
    APN::Notification.send_notifications
  end
  
end
