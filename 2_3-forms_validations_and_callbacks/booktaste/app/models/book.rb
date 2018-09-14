class Book < ApplicationRecord
  PUBLISHERS = %w(MIR Lenta4).freeze

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :preview, presence: true
  validates :description, presence: true
  validates :author, presence: true, length: { maximum: 50 }
  validates :year, numericality: {
                     greater_than_or_equal_to: -> (_) { Time.zone.now.year - 200 },
                     less_than_or_equal_to: -> (_) { Time.zone.now.year }
                   },
                   presence: true
  validates :publisher, presence: true
  validate :existing_publisher

  private

  def existing_publisher
    return if PUBLISHERS.include? publisher
    errors.add(:publisher, "must be from a white list")
  end
end