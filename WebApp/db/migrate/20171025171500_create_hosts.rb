class CreateHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :hosts do |t|
      t.text :ip
      t.text :mac

      t.timestamps
    end
  end
end
