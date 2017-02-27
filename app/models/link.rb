class Link < ApplicationRecord
  def self.top_ten
    where('updated_at > ?', 24.hours.ago).order(read_count: :desc).limit(10)
  end
end
