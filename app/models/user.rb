class User < ApplicationRecord
  before_create :default_values
  has_one_attached :avatar
  has_many :sections, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  #validates :password_digest, :length => { :maximum => 30 }
  #validates :username, :length => { :maximum => 15 }
  private
    def default_values
      self.nivel_respueston ||= "Bronce"
      self.nivel_publicon ||= "Bronce"
    end
end
