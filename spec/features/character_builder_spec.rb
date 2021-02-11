shared_examples "a character builder" do
  it {is_expected.to respond_to(:build)}
  it {is_expected.to respond_to(:set_name).with(1).argument}
  it {is_expected.to respond_to(:set_height).with(1).argument}
  it {is_expected.to respond_to(:set_mass).with(1).argument}
  it {is_expected.to respond_to(:set_birth_year).with(1).argument}

  before do
    @character_builder = described_class.new
    character_name = "Darth Vader"
  end

  describe "#set_name" do

    it "should return builder object" do
      expect(@character_builder.set_name('Luke Skywalker')).to be_an_instance_of described_class
    end

  end

  describe "#set_height" do

    it "should return builder object" do
      expect(@character_builder.set_height(172)).to be_an_instance_of described_class
    end

  end
  describe "#set_mass" do

    it "should return builder object" do
      expect(@character_builder.set_mass(77)).to be_an_instance_of described_class
    end

  end
  describe "#set_birth_year" do

    it "should return builder object" do
      expect(@character_builder.set_birth_year("19BBY")).to be_an_instance_of described_class
    end

  end

  describe "#build" do
    it "should return instance of a Character" do
      character = @character_builder.build

      expect(character).to be_an_instance_of Character
    end

    it 'should return Character with correct attributes' do
      @character_builder.set_name(character_name)
      @character_builder.set_height(188)
      @character_builder.set_mass(89)
      @character_builder.set_birth_year("18BBY")
      new_character = @character_builder.build

      expect(new_character.name).to eql "name"
      expect(new_character.age).to eql 22
      expect(new_character.hair_color).to eql "black"
    end
  end
end