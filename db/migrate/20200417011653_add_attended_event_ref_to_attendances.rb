class AddAttendedEventRefToAttendances < ActiveRecord::Migration[6.0]
  def change
  	add_reference :attendances, :attended_event, references: :events, index: true
  end
end
