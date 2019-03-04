class Item < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 140} 
  validates :description, presence: true, length: {minimum: 10, maximum: 1000}
  validates :price, presence: true, if: :validate_price
  validates :img_url, presence: true

  private

  def validate_price
    if price >= 1 && price <= 1000
      return true
    else
      errors.add{"Price not good ! min 1 / max 1000"}
    end
  end

end
