class ChallengeDatum < ActiveRecord::Base
  attr_accessible :difficulty, :name

  DIFFICULTY = [:easy, :medium, :hard, :crazy]
  DIFFICULTY.each_with_index do |lvl, i|
    exp = i + 1
    scope lvl, -> {where("exp == ?", exp)}
  end
  
  def diffname
    DIFFICULTY[difficulty.to_i - 1].to_s
  end
end
