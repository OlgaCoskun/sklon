class Person < ApplicationRecord
  # include Petrovich::Extension

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
    # здесь пробовала другие окончания( как 'genitive.to_s', '_genitive', '.to(:genetive)') в зависимост от версии
    # гема Petrovich, все приводили к ошибкам
    # self.first_name.genitive.to_s

    # если просто выводить в табл Declensions имена, то это будет выглядеть так:
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
    # build_declension(genitive_fname: 'olga') # так тоже работает

    # записывает ФИО в табл declension. К сожалению без склонений, гем Петрович не работает.
    build_declension(genitive_fname: my_firstname, genitive_mname: my_middlename, genitive_lname: my_lastname)
  end
end
