class Dog < ActiveRecord::Base
  has_one:toy
  belongs_to:person
end