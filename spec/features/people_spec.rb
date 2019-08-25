require 'rails_helper'

RSpec.feature 'People', type: :feature do
  scenario 'create a new person' do
    visit root_path
    click_link 'создать персону'
    fill_in 'person[first_name]', with: 'Иван'
    fill_in 'person[last_name]', with: 'Васильевич'
    fill_in 'person[middle_name]', with: 'Шпак'
    select 'Мужской', from: 'person[gender]'
    click_on 'Сохранить'

    expect(page).to have_content 'Person was successfully created.'
    expect(page).to have_content 'Иван'
    expect(page).to have_content 'Васильевич'
    expect(page).to have_content 'Шпак'
    expect(page).to have_content 'Мужской'
  end
end
