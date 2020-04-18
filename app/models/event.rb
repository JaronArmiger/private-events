class Event < ApplicationRecord
	belongs_to :host, class_name: "User"
	has_many :attendances, foreign_key: :attended_event_id
	has_many :attendees, through: :attendances

	has_many :invitations, foreign_key: :invited_event_id
	has_many :invited_guests, through: :invitations

	scope :past, -> { where("date <= ?", Time.now) }
	scope :upcoming, -> { where("date > ?", Time.now) }
end
