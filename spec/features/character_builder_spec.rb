shared_examples "a character builder" do
  it {is_expected.to respond_to(:build)}
  it {is_expected.to respond_to(:set_name).with("Luke Skywalker").argument}
  it {is_expected.to respond_to(:set_height).with(172).argument}
  it {is_expected.to respond_to(:set_mass).with(77).argument}
  it {is_expected.to respond_to(:set_birth_year).with("199BY").argument}

  before do
    @character_builder = described_class.new
  end

  describe "#set_name" do
    it "should correctly assign name attribute" do
      @character_builder.set_name("Luke Skywalker")

      expect(@character_builder.name).to eq("Luke Skywaler")
    end

    it "should return builder object" do
      expect(@character_builder.set_name('Luke Skywalker')).to be_an_instance_of described_class
    end

  end

  describe "#set_height" do
    it "should correctly assign height attribute" do
      @character_builder.set_height(172)

      expect(@character_builder.height).to eq(172)
    end

    it "should return builder object" do
      expect(@character_builder.set_height(172)).to be_an_instance_of described_class
    end

  end
  describe "#set_mass" do
    it "should correctly assign mass attribute" do
      @character_builder.set_mass(77)

      expect(@character_builder.mass).to eq(77)
    end
    it "should return builder object" do
      expect(@character_builder.set_mass(77)).to be_an_instance_of described_class
    end

  end
  describe "#set_birth_year" do
    it "should correctly assign birth_year attribute" do
      @character_builder.set_birth_year("19BBY")

      expect(@character_builder.birth_year).to eq("19BBY")
    end
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
      @character_builder.set_name("Darth Vader")
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