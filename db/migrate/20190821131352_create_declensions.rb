class CreateDeclensions < ActiveRecord::Migration[6.0]
  def change
    create_table :declensions do |t|
      t.string :dative_fname, comment: 'дательный'
      t.string :accusative_fname, comment: 'винительный'
      t.string :instrumental_fname, comment: 'творительный'
      t.string :prepositional_fname, comment: 'предложный'
      t.string :genitive_fname, comment: 'родительный'

      t.string :dative_mname, comment: 'дательный'
      t.string :accusative_mname, comment: 'винительный'
      t.string :instrumental_mname, comment: 'творительный'
      t.string :prepositional_mname, comment: 'предложный'
      t.string :genitive_mname, comment: 'родительный'

      t.string :dative_lname, comment: 'дательный'
      t.string :accusative_lname, comment: 'винительный'
      t.string :instrumental_lname, comment: 'творительный'
      t.string :prepositional_lname, comment: 'предложный'
      t.string :genitive_lname, comment: 'родительный'

      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
