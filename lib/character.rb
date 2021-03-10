require 'json'

class Character
  attr_reader :json_params
  attr_reader :name
  attr_reader :species


  #TODO this class should contain real object of character, not only work on json_params
  def initialize(**params)
    @json_params = json_prams
    @name = params[:name]
    @species = params[:species]
    validate!
  end

  def is_human?
    #I don't need to GET SPECIES because of logic: empty species -> human, not empty -> not human
    # species = prepare_species(json_params)
    # TODO Should I do such a things overe here? Maybe I should go with this to some SWAPI method?
    results = json_params[0]
    species = results["species"]
    if species.empty?
      p "is human"
      false
    else
      p "is not human"
      true
    end
  end

  def validate!
    raise ArgumentError.new("name must be present") unless name
    raise ArgumentError.new("race must be present") unless species
    raise TypeError.new("race must be collection") unless species.respond_to? :each
  end
end