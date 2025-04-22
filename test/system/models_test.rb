require "application_system_test_case"

class ModelsTest < ApplicationSystemTestCase
  setup do
    @model = models(:one)
  end

  test "visiting the index" do
    visit models_url
    assert_selector "h1", text: "Models"
  end

  test "should create model" do
    visit models_url
    click_on "New model"

    fill_in "Armour save", with: @model.armour_save
    fill_in "Cost", with: @model.cost
    fill_in "Description", with: @model.description
    fill_in "Invuln save", with: @model.invuln_save
    fill_in "Leadership", with: @model.leadership
    fill_in "Max squad", with: @model.max_squad
    fill_in "Min squad", with: @model.min_squad
    fill_in "Movement", with: @model.movement
    fill_in "Name", with: @model.name
    fill_in "Obj control", with: @model.obj_control
    fill_in "Toughness", with: @model.toughness
    fill_in "Unit limit", with: @model.unit_limit
    fill_in "Wounds", with: @model.wounds
    click_on "Create Model"

    assert_text "Model was successfully created"
    click_on "Back"
  end

  test "should update Model" do
    visit model_url(@model)
    click_on "Edit this model", match: :first

    fill_in "Armour save", with: @model.armour_save
    fill_in "Cost", with: @model.cost
    fill_in "Description", with: @model.description
    fill_in "Invuln save", with: @model.invuln_save
    fill_in "Leadership", with: @model.leadership
    fill_in "Max squad", with: @model.max_squad
    fill_in "Min squad", with: @model.min_squad
    fill_in "Movement", with: @model.movement
    fill_in "Name", with: @model.name
    fill_in "Obj control", with: @model.obj_control
    fill_in "Toughness", with: @model.toughness
    fill_in "Unit limit", with: @model.unit_limit
    fill_in "Wounds", with: @model.wounds
    click_on "Update Model"

    assert_text "Model was successfully updated"
    click_on "Back"
  end

  test "should destroy Model" do
    visit model_url(@model)
    click_on "Destroy this model", match: :first

    assert_text "Model was successfully destroyed"
  end
end
