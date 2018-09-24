class College < ApplicationRecord
  has_many :branches
  has_many :students, through: :branches
  validates :name, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  scope :active, -> { where(active_record: true)}
  default_scope { active } 
end
