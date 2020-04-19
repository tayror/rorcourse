class Order < ApplicationRecord

  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)

    cart.line_items.update_all(order_id: id, cart_id: nil)

   
  end
end
