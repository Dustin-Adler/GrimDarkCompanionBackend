class AddAffliateModelIdToModels < ActiveRecord::Migration[8.0]
  def change
    add_column :models, :affiliate_model_id, :integer, default: nil
    add_column :models, :big_squad_points_adjustment, :integer, default: 0
    change_column :models, :cost, :float
  end
end
