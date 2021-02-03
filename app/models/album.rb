class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :name, presence: :true
  validates :index, presence: :true
  validates :description, presence: :true

end
