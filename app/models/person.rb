class Person < ApplicationRecord
  has_one :declension, dependent: :destroy
  before_create :set_names

  GENDER_TYPES = ["none", "Мужской", "Женский"]

  validates :first_name, presence: true
  before_save :create_full_name

  Petrovich firstname: :my_firstname,
            middlename: :my_middlename,
            lastname: :my_lastname,
            gender: :my_gender

  def my_firstname
    self.first_name
  end

  def my_middlename
    self.middle_name
  end

  def my_lastname
    self.last_name
  end

  # метод гема Петрович, должен склонять, если даже пол не указан.
  def my_gender
    :male
  end

  def create_full_name
    self.full_name = [last_name, first_name, middle_name].join(' ')
  end

  def set_names
    p_genetive = Petrovich(firstname: my_firstname, middlename: my_middlename, lastname: my_lastname).genitive
    p_dative = Petrovich(firstname: my_firstname, middlename: my_middlename, lastname: my_lastname).dative
    p_accusative = Petrovich(firstname: my_firstname, middlename: my_middlename, lastname: my_lastname).accusative
    p_instrumental = Petrovich(firstname: my_firstname, middlename: my_middlename, lastname: my_lastname).instrumental
    p_prepositional = Petrovich(firstname: my_firstname, middlename: my_middlename, lastname: my_lastname).prepositional


    build_declension(genitive_fname: p_genetive.firstname, genitive_mname: p_genetive.middlename, genitive_lname: p_genetive.lastname,
                     dative_fname: p_dative.firstname, dative_mname: p_dative.middlename, dative_lname: p_dative.lastname,
                     accusative_fname: p_accusative.firstname, accusative_mname: p_accusative.middlename, accusative_lname: p_accusative.lastname,
                     instrumental_fname: p_instrumental.firstname, instrumental_mname: p_instrumental.middlename, instrumental_lname: p_instrumental.lastname,
                     prepositional_fname: p_prepositional.firstname, prepositional_mname: p_prepositional.middlename, prepositional_lname: p_prepositional.lastname
                     )

  end
end
