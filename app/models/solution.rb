class Solution < ActiveRecord::Base
	belongs_to :user
	belongs_to :problem 
  	validates :description, presence: true
end
