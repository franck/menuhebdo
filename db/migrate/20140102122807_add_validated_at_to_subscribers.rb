class AddValidatedAtToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :validated_at, :datetime
  end
end
