class Schedule < ApplicationRecord
  with_options presence: true do
    validates :title, length: {maximum: 20}
    validates :note
    validates :start_date
    validates :end_date
  end
  validate :start_end_check

  def start_end_check
    if end_date.present?
      if Date.today > end_date
        errors.add(:end_date, "は今日以降の日付を選択してください") 
      else
        true
      end
    else
      errors.add(:end_date, "は今日以降のものを選択してください")
    end
  end
end
