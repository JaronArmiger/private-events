class Invitation < ApplicationRecord
	belongs_to :invited_guest, class_name: "User"
	belongs_to :invited_event, class_name: "Event"
end
