class CreateWineOenologists < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_oenologists do |t|
      t.references :wine, foreign_key: true
      t.references :oenologist, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
