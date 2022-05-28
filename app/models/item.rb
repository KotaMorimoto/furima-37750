class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true, blob: {content_type: :image}
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :lead_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, format: {with: /\A[0-9]+\z/ }, numericality: {in: 300..9999999}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipment_fee
  belongs_to :prefecture
  belongs_to :lead_time

end
