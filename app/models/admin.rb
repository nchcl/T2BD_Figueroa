class Admin < ApplicationRecord
  belongs_to :section
  belongs_to :user
end
