class User < ApplicationRecord
	has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
	has_many :attendances, foreign_key: :attendee_id
	has_many :attended_events, through: :attendances

	has_many :invitations, foreign_key: :invited_guest_id
	has_many :invited_events, through: :invitations

	def upcoming_events
		#self.email
		attended_events.where("date > ?", Time.now)
	end

	def previous_events
		attended_events.where("date <= ?", Time.now)
	end
end
