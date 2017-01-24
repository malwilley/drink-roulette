module Ingredients.Models exposing (..)

type alias IngredientId = Int
type Category = Alcohol | Mixer | Other

-- generic ingredient object
-- mapped from BackendIngredient
type alias Ingredient =
  { id : IngredientId
  , name : String
  , category : Category
  , selected : Bool
  }

-- created from backend ingredients json
type alias BackendIngredient =
  { id: Int
  , name: String
  , category: Int
  }
