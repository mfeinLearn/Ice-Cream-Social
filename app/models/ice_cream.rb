class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user #creater of it
  has_many :reviews
  has_many :users, through: :reviews # people who have reviewed it

  validates :flavor, presence: true
  validate :not_a_duplicate # custome validator

  # scope method
  scope :order_by_rating, -> {IceCream.left_joins(:reviews).group(:id).order('avg(stars) desc')}
  # scope method
  # order the ice cream alphabetically
  def self.alpha
    # active record sql term that will allow me to order
    # we can use a string or symbol
    # order(attribute: :desc)
    # order(attribute: :asc)
    order(:flavor)
  end

  def brand_attributes=(attributes)
     brand = Brand.find_or_create_by(attributes) if !attributes[:name].empty?
  end

  def not_a_duplicate # custome validator
    # if their is already an ice cream with that flavor && brand, throw an error

    # you have direct access to the attributes you are in an instance method which means you can call
    # other instance methods which means which means we can call flavor ^ . it is just calling the attribute
    if IceCream.find_by(flavor: flavor, brand_id: brand_id)
      # we want to add an error we name this attribute that we want to call

      # we name what attribute we want this error to be associated with
      errors.add(:flavor, "has already been added for that brand")
    end
  end

  def flavor_and_brand # a reader method to display flavor and brand
    "#{flavor} - #{brand.name}"

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
