class CreateVisitedDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :visited_domains do |t|
      t.text :host
      t.integer :times

      t.timestamps
    end
  end
end
