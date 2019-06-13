class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user #creater of it
  has_many :reviews
  has_many :users, through: :reviews # people who have reviewed it
  accepts_nested_attributes_for :brand
end

# def brand
# end
# def brand=
# end
#
# def brand_build
# end
#
# def brand_id
# end
#
# def brand_id=
# end
