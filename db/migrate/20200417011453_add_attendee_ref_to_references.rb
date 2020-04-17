class AddAttendeeRefToReferences < ActiveRecord::Migration[6.0]
  def change
  	add_reference :attendances, :attendee, references: :users, index: true
  end
end
