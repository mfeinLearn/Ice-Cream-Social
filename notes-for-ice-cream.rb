Ice Cream Social (Review site for ice cream)

User
  - Username
  - Password
  - Has_many reviews
  - Has_many ice_creams through reviews

Brand
  - In_grocery :boolean
  - Has_many ice creams

Ice cream
  - Belongs_to brand
  - Belongs_to user
  - Flavor
  - Description
  - Has_many Reviews
  - Has_many users, through reviews

Reviews
  - ice_cream_id
  - Stars
  - Title
  - content


  -----------------
  Setting up a Belongs_to when you are setting up
  your models(in the generators):

  rails g resource IceCream flavor:string description:string brand:belongs_to user:belongs_to
  # brand:belongs_to user:belongs_to -

  Another way to write your migrations:

t.belongs_to :user, foreign_key: true
 and
 t.integer :user_id
 are the samething

 t.belongs_to :user, foreign_key: true - when you actually migrate it
 it will give you an index which will allow AR when it is hitting the
 db to retrieve that has many relationship quicker. It is a cleaner way to
 write your relationships.

 ------

 # A welcome page would work better in sessions because it does
 # not deal with the model in paticular but it has to deal with
 # just showing up to the site. Also we would add my welcome page
 # as well in the sessions controller

 ----------

# password field:
#  we dont use password_digest as an attribute in the form
#  because it will set the string that you type as the password_digest
#  instead of the actual digest.
