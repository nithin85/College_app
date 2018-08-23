class Student < ApplicationRecord
belongs_to :branch
validates :student_name, presence: true
validates :student_address, presence: true
validates :student_sem, presence: true 
end
