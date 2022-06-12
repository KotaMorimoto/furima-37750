class OrderShipment
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :branch, :building, :phone, :order_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :branch
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipment.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, branch: branch, building: building,
                    phone: phone, order_id: order.id)
  end
end
