class College < ApplicationRecord
has_many :branches
validates :name, presence: true
validates :address, presence: true
validates :contact, presence: true

end
