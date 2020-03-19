class Section < ApplicationRecord
  belongs_to :user
  has_many :posts, :dependent => :destroy
  has_many :admins, :dependent => :destroy
end
