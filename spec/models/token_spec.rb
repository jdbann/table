require "rails_helper"

RSpec.describe Token, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:map) }
    it { is_expected.to belong_to(:tokenable).optional(true) }
    it { is_expected.to have_one(:image_attachment) }
    it { is_expected.to have_one(:image_blob) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :image }
  end

  describe "#name" do
    it "returns the token's name if overridden" do
      character = build(:character, name: "Character Name")
      token = described_class.new(name: "Token Name", tokenable: character)

      expect(token.name).to eq "Token Name"
    end

    it "returns the tokenable's name if not overridden" do
      character = build(:character, name: "Character Name")
      token = described_class.new(name: "", tokenable: character)

      expect(token.name).to eq "Character Name"
    end
  end

  describe "#image" do
    it "returns the token's image if overridden" do
      character = create(
        :character,
        image: Rack::Test::UploadedFile.new("spec/fixtures/files/tanpos.jpeg")
      )
      token = create(
        :token,
        image: Rack::Test::UploadedFile.new("spec/fixtures/files/uxil.jpeg"),
        tokenable: character
      )

      expect(token.image.filename.to_s).to eq "uxil.jpeg"
    end

    it "returns the tokenable's name if not overridden" do
      character = create(
        :character,
        image: Rack::Test::UploadedFile.new("spec/fixtures/files/tanpos.jpeg")
      )
      token = create(
        :token,
        image: nil,
        tokenable: character
      )

      expect(token.image.filename.to_s).to eq "tanpos.jpeg"
    end
  end
end
