class AddHostRefToEvents < ActiveRecord::Migration[6.0]
  def change
  	add_reference :events, :host, references: :users, index: true
  end
end
