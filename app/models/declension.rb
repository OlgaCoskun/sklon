class Declension < ApplicationRecord
  # belongs_to :person

  def my_firstname_genitive
    @declension.genitive_fname = @person.my_firstname
  end

  def my_lastname_genitive
    @declension.genitive_lname = @person.my_lastname
  end

  def my_middlename_genitive
    @declension.genitive_mname = @person.my_middlename
  end
end
