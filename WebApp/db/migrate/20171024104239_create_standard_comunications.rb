class CreateStandardComunications < ActiveRecord::Migration[5.1]
  def change
    create_table :standard_comunications do |t|
      t.datetime :date
      t.text :data
      t.text :source
      t.text :destination
      t.text :protocol
      t.text :host

      t.timestamps
    end
  end
end
