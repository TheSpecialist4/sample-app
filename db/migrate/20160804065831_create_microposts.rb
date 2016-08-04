class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |t|
    	# workaround for belongs_to
    	#t.belongs_to :user
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    # add index to these columns
    add_index :microposts, [:user_id, :created_at]
  end
end
