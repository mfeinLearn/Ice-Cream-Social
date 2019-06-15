class Review < ApplicationRecord
  belongs_to :user
  belongs_to :ice_cream

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  ##### making your validations custom so you can create user friendly errors
  # example:
  # will read: Ice Cream Id has already been reviewed by you

  #validates :ice_cream_id, uniqueness: { scope: :user_id, message: "has already been reviewed by you" } #this will tell the user that the ice_cream_id has already been reviewed by you

  # will read: Ice Cream has already been reviewed by you
                                                    # this is where you can add a custom message!
  validates :ice_cream, uniqueness: { scope: :user, message: "has already been reviewed by you" }# this will also work and it is a lot more readable then this ^
end
