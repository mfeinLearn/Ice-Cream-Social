class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user #creater of it
  has_many :reviews
  has_many :users, through: :reviews # people who have reviewed it

  def brand_attributes=(attributes)
     brand = Brand.find_or_create_by(attributes) if !attributes[:name].empty?
  end

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
