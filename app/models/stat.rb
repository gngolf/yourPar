class Stat < ApplicationRecord
  belongs_to :user
  validates :hole1_par, :course, 
    		:hole2_par, :hole3_par, :hole4_par, :hole5_par, :hole6_par, :hole7_par, :hole8_par, :hole9_par, :hole10_par, :hole11_par, :hole12_par, 
    		:hole13_par, :hole14_par, :hole15_par, :hole16_par, :hole17_par, :hole18_par, :hole1_score, :hole2_score, :hole3_score, :hole4_score, 
    		:hole5_score, :hole6_score, :hole7_score, :hole8_score, :hole9_score, :hole10_score, :hole11_score, :hole12_score, :hole13_score, :hole14_score, :hole15_score, 
    		:hole16_score, :hole17_score, :hole18_score, :hole1_gir, :hole2_gir, :hole3_gir, :hole4_gir, :hole5_gir, :hole6_gir, :hole7_gir, :hole8_gir, :hole9_gir, :hole10_gir, 
    		:hole11_gir, :hole12_gir, :hole13_gir, :hole14_gir, :hole15_gir, :hole16_gir, :hole17_gir, :hole18_gir, :hole1_putts, :hole2_putts, :hole3_putts, 
    		:hole4_putts, :hole5_putts, :hole6_putts, :hole7_putts, :hole8_putts, :hole9_putts, :hole10_putts, :hole11_putts, :hole12_putts, :hole13_putts, 
    		:hole14_putts, :hole15_putts, :hole16_putts, :hole17_putts, :hole18_putts , presence: true
end

#:hole1_fway, :hole2_fway, :hole3_fway, :hole4_fway, :hole5_fway, :hole6_fway, :hole7_fway, 
    		#:hole8_fway, :hole9_fway, :hole10_fway, :hole11_fway, :hole12_fway, :hole13_fway, :hole14_fway, :hole15_fway, :hole16_fway, :hole17_fway, 
    		#:hole18_fway, 