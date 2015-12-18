class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :instructions, presence: true, length: { minimum: 10 }

end