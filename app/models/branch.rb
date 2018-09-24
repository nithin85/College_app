class Branch < ApplicationRecord
  belongs_to :college
  has_many :students
  validates :branch_name, presence: true
end
