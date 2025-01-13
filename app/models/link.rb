class Link < ApplicationRecord
  validates :original_url, presence: true, url: true
  validates :short_url, uniqueness: true
  
  before_validation :generate_short_url, on: :create
  
  private
  
  def generate_short_url
    loop do
      self.short_url = SecureRandom.alphanumeric(6)
      break unless Link.exists?(short_url: short_url)
    end
  end
end