require "rails_helper"

RSpec.describe "Visitor viewing a map", type: :system do
  it "can zoom the map" do
    map = create :map, name: "Dwarven Excavation", zoom: 0
    map.campaign.update(current_map: map)

    visit campaign_path(map.campaign)

    expect(page).to have_map_with_data(map, "zoom", "0")
    expect(find("[data-target='map.zoomOut']")).to be_disabled

    find(".current-map__zoom-in").click

    expect(page).to have_map_with_data(map, "zoom", "1")
  end

  it "can move the map" do
    map = create :map, name: "Dwarven Excavation"
    map.campaign.update(current_map: map)

    visit campaign_path(map.campaign)
    click_and_move_map(map, from: { x: 300, y: 300 }, to: { x: 50, y: 50 })

    expect(page).to have_map_with_data(map, "x", "550")
    expect(page).to have_map_with_data(map, "y", "550")
  end

  it "does not see option to create new maps" do
    campaign = create :campaign
    create :map, campaign: campaign, name: "Dwarven Excavation"
    visit campaign_path(campaign)
    expect(page).not_to have_content "New Map"
  end

  it "does not see option to create new characters" do
    campaign = create(:campaign)

    visit campaign_path(campaign)

    expect(page).not_to have_content "New Character"
  end
end
