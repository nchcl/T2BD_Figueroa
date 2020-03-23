class Reply < ApplicationRecord
  before_create :default_values

  belongs_to :post
  belongs_to :section
  belongs_to :user
  has_one_attached :image
  validates :message, presence: true

  private
    def default_values
      self.date_created ||= DateTime.now
      self.time_created ||= Time.now.strftime("%H:%M:%S")
    end
end
