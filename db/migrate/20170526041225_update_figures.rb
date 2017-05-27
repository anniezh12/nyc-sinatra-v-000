class UpdateFigures < ActiveRecord::Migration
  def change
    remove_column :figures, :figure_id
  end
end
