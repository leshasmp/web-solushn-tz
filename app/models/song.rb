# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads

  validates :title, :length, :filesize, presence: true

  def self.top(days, count)
    Song.joins(:download).where(created_at: (Date.today - days.days)..Date.today).order(count: :desc).limit(count)
  end
end
