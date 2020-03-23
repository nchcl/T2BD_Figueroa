class Post < ApplicationRecord
  before_create :default_values

  belongs_to :section
  belongs_to :user
  has_one_attached :image
  has_many :replies, :dependent => :destroy
  validates :message, presence: true

  private
    def default_values
      self.date_created = DateTime.now
      self.time_created = Time.now.strftime("%H:%M:%S")
      self.likes = 0
      self.dislikes = 0
      self.locked = false
    end
end
