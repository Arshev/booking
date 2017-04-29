class AddCarRelationUser < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :cars, :user, index: true
  end
end
