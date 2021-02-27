require 'json'

class Character
  def is_human?(json_params)
    #I don't need to GET SPECIES because of logic: empty species -> human, not empty -> not human
  species = prepare_species(json_params)
    if species.empty?
      p "is human"
      false
    else
      p "is not human"
      true
    end
  end

  def prepare_species(json_params)
    data = JSON.parse(json_params.body)
    results = data["results"]
    results = results[0]
    results["species"]
  end

end