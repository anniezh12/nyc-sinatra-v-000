class UpdatingFigure < ActiveRecord::Migration
  def change
    add_column :figures, :figure_id, :integer
  end
end
