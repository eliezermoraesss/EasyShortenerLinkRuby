class Link < ApplicationRecord
  # Validações
  validates :original_url, presence: true, url: true
  validates :short_url, uniqueness: true
  
  # Callback para gerar URL curta antes de salvar
  before_validation :generate_short_url, on: :create
  
  private
  
  def generate_short_url
    # Gera uma string aleatória até encontrar uma única
    loop do
      self.short_url = SecureRandom.alphanumeric(6)
      break unless Link.exists?(short_url: short_url)
    end
  end
end