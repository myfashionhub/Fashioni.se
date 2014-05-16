class DogWalker < ActiveRecord::Base
  has_many :walks
  has_many :dogs, through: :walks
end


class Dog < ActiveRecord::Base
  has_many :walks
  has_many :dogwalkers, through: :walks
end


class Walk < ActiveRecord::Base
  belongs_to :dog
  belongs_to :dogwalker
end

# Join table model
    create_table :walks do |t|
      t.string :destination
      t.datetime :day
      t.references :dog
      t.references :dogwalker
      t.timestamps

pepe = Dog.create(name: 'Pepe')
lich = DogWalker.create(name: 'Lichard')
walk_to_stars = Walk.create(destination: 'the Stars', dog: pepe, dogwalker: lich)
