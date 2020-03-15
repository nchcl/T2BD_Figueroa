class Post < ApplicationRecord
  before_create :default_values

  belongs_to :section
  belongs_to :user
  has_one_attached :image

  private
    def default_values
      self.date_created ||= DateTime.now
      self.time_created ||= Time.now.strftime("%H:%M:%S")
      self.likes ||= 0
      self.dislikes ||= 0
      self.locked ||= 0
    end
end
