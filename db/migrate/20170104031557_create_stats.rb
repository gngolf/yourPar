class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.string :course
      t.date :date
      t.integer :score
      t.integer :penalties
      t.integer :up_down
      t.integer :sand_attempt
      t.integer :sand_save
      t.float :holed_putt_length
      t.integer :hole1_par
      t.integer :hole2_par
      t.integer :hole3_par
      t.integer :hole4_par
      t.integer :hole5_par
      t.integer :hole6_par
      t.integer :hole7_par
      t.integer :hole8_par
      t.integer :hole9_par
      t.integer :hole10_par
      t.integer :hole11_par
      t.integer :hole12_par
      t.integer :hole13_par
      t.integer :hole14_par
      t.integer :hole15_par
      t.integer :hole16_par
      t.integer :hole17_par
      t.integer :hole18_par
      t.integer :hole1_score
      t.integer :hole2_score
      t.integer :hole3_score
      t.integer :hole4_score
      t.integer :hole5_score
      t.integer :hole6_score
      t.integer :hole7_score
      t.integer :hole8_score
      t.integer :hole9_score
      t.integer :hole10_score
      t.integer :hole11_score
      t.integer :hole12_score
      t.integer :hole13_score
      t.integer :hole14_score
      t.integer :hole15_score
      t.integer :hole16_score
      t.integer :hole17_score
      t.integer :hole18_score
      t.string :hole1_fway
      t.string :hole2_fway
      t.string :hole3_fway
      t.string :hole4_fway
      t.string :hole5_fway
      t.string :hole6_fway
      t.string :hole7_fway
      t.string :hole8_fway
      t.string :hole9_fway
      t.string :hole10_fway
      t.string :hole11_fway
      t.string :hole12_fway
      t.string :hole13_fway
      t.string :hole14_fway
      t.string :hole15_fway
      t.string :hole16_fway
      t.string :hole17_fway
      t.string :hole18_fway
      t.string :hole1_gir
      t.string :hole2_gir
      t.string :hole3_gir
      t.string :hole4_gir
      t.string :hole5_gir
      t.string :hole6_gir
      t.string :hole7_gir
      t.string :hole8_gir
      t.string :hole9_gir
      t.string :hole10_gir
      t.string :hole11_gir
      t.string :hole12_gir
      t.string :hole13_gir
      t.string :hole14_gir
      t.string :hole15_gir
      t.string :hole16_gir
      t.string :hole17_gir
      t.string :hole18_gir
      t.integer :hole1_putts
      t.integer :hole2_putts
      t.integer :hole3_putts
      t.integer :hole4_putts
      t.integer :hole5_putts
      t.integer :hole6_putts
      t.integer :hole7_putts
      t.integer :hole8_putts
      t.integer :hole9_putts
      t.integer :hole10_putts
      t.integer :hole11_putts
      t.integer :hole12_putts
      t.integer :hole13_putts
      t.integer :hole14_putts
      t.integer :hole15_putts
      t.integer :hole16_putts
      t.integer :hole17_putts
      t.integer :hole18_putts
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
