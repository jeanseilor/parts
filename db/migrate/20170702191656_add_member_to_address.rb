class AddMemberToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :member, foreign_key: true
  end
end
