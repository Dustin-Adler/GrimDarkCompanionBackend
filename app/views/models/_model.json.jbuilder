json.extract! model, :id, :name, :description, :movement, :cost, :min_squad, :max_squad, :unit_limit, :toughness, :armour_save, :invuln_save, :wounds, :leadership, :obj_control, :created_at, :updated_at
json.url model_url(model, format: :json)
