# frozen_string_literal: true

class Download < ApplicationRecord
  belongs_to :song

  validates :count, presence: true
end
