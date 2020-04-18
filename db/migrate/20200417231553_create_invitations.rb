class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer "invited_guest_id"
      t.integer "invited_event_id"
      t.index ["invited_guest_id"], name: "index_invitations_on_invited_guest_id"
      t.index ["invited_event_id"], name: "index_invitations_on_invited_event_id"
      t.timestamps
    end
  end
end
