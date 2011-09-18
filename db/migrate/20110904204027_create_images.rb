class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|

      t.timestamps
      t.string    :url, :default => nil
      t.string    :filename, :default => nil
      t.integer   :user_id, :default => 1
    end
    
    change_table :images do |t|
      
      add_index   :images, :user_id
    end
  end

  def self.down
    drop_table :images
  end
end
