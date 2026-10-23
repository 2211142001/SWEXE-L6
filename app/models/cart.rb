class Cart < ApplicationRecord
  has_many :cart_item, dependent: :destroy
end
