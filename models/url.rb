class Url < ActiveRecord::Base
  validates :original_url, presence: true, uniqueness: true
  validates :original_url, format: { with: URI.regexp }, if: -> { original_url.present? }

  before_commit :generate_short_url, on: :create

  def generate_short_url
    self.short_url = SecureRandom.alphanumeric(6)
  end
end
