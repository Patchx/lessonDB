class Lesson < ActiveRecord::Base
	belongs_to :user
	has_attachment  :file, accept: [:jpg, :png, :gif, :pdf]
	validates :file, presence: true
	validates :title, presence: true
end
