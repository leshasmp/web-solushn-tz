# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :songs

  validates :name, presence: true

  def songs_top
    songs = self.songs
    Song.joins(:download).where(id: songs).order(count: :desc)
  end

  def self.top(letter, count)
    Artist.joins(songs: [:download]).where('name LIKE ?', "#{letter}%").order(count: :desc).limit(count)
  end
end
