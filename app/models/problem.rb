class Problem < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
  	validates :description, presence: true
end
