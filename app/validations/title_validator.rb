class TitleValidator < ActiveModel::Validator
  CLICKBAIT = ["Won't Believe", "Secret", "Guess", "Top /\A[+-]?\d+\z/"]
  def validate(record)
    baiting = false
    if record.title  
      CLICKBAIT.each do | keyword |
        if record.title.include?(keyword)
          baiting = true
        end
      end
      baiting ? nil : record.errors.add(:title, "Not Click-baiting")
    else
      record.errors.add(:title, "Title must exist.")
    end
  end
end