class AddVacanciesLeftToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :vacancies_left, :integer, default: 0
  end
end
