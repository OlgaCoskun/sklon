class RemoveGenderFromPerson < ActiveRecord::Migration[6.0]
  def change

    remove_column :people, :gender, :integer
  end
end
