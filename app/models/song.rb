# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads

  validates :title, :length, :filesize, presence: true

  def self.top(days, count)
    Song.joins(:downloads)
        .where(downloads: { created_at: days.days.ago..Time.current })
        .group(:id)
        .order('COUNT(downloads.id) DESC')
        .limit(count)
  end
end
