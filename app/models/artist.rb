# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :songs, -> { order(title: :asc) }

  validates :name, presence: true

  def songs_top
    Song.where(id: songs.ids)
        .joins(:downloads)
        .group(:id)
        .order('COUNT(downloads.id) DESC')
  end

  def self.top(letter, count)
    Artist.where('name LIKE ?', "#{letter}%").limit(count)
  end
end
