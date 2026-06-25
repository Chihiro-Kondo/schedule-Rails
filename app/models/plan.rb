class Plan < ApplicationRecord
  validates :title, presence: true, length: { in: 1..20 }
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validate :finish_day_after_start_day
  validates :memo, length: { in: 0..500 }

  def finish_day_after_start_day
    if finish_day < start_day
      errors.add(:finish_day, "は開始日以降の日付を入力してください")
    end
  end
end
