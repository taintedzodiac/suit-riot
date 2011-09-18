class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|

      t.timestamps
      t.integer :overall_score,     :default => nil
      t.integer :tops_score,        :default => nil
      t.integer :pants_score,       :default => nil
      t.integer :shoes_score,       :default => nil
      t.integer :accessories_score, :default => nil
      t.integer :user_id,           :default => nil
      t.integer :image_id,          :default => nil
    end
    
    change_table :votes do |t|
      add_index :votes, :user_id
      add_index :votes, :image_id
      add_index :votes, :overall_score
      add_index :votes, :tops_score
      add_index :votes, :pants_score
      add_index :votes, :shoes_score
      add_index :votes, :accessories_score
    end
  end

  def self.down
    drop_table :votes
  end
end
