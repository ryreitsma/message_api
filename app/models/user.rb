class User < ActiveRecord::Base
  has_many :messages
  
  def write_message(content)
    self.messages.create!(content: content)
  end
end
