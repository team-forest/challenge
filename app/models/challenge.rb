class Challenge < ActiveRecord::Base
  attr_accessible :exp, :name, :status, :user_id, :sender_id

  belongs_to :user
  belongs_to :sender, class_name: 'User'

  scope :for_today, -> { where("created_at >= ?", Time.now.beginning_of_day)}
  scope :done, -> { where("status == ?", 'done')}

  DIFFICULTY = [:easy, :medium, :hard, :crazy]
  DIFFICULTY.each_with_index do |lvl, i|
    exp = i + 1
    scope lvl, -> {where("exp == ?", exp)}
  end

  def self.is_done?
    count = for_today.count 
    done_count = for_today.done.count
    count == done_count
  end

  def self.has_pending?
    count = for_today.count 
    done_count = for_today.done.count
    count != done_count
  end

  def difficulty
    DIFFICULTY[exp.to_i - 1].to_s
  end
end
