module Ingredients.Models exposing (..)


init : Model
init =
    { list = []
    , searchFocus = False
    , searchQuery = ""
    }


type alias Model =
    { list : List Ingredient
    , searchFocus : FocusBool
    , searchQuery : Query
    }


type alias IngredientId =
    Int


type Category
    = Alcohol
    | Mixer
    | Other


type alias Ingredient =
    { id : IngredientId
    , name : String
    , category : Category
    , selected : Bool
    }


type alias SearchState =
    { query : Query
    , focus : FocusBool
    }


type alias Query =
    String


type alias FocusBool =
    Bool


type alias BackendIngredient =
    { id : Int
    , name : String
    , category : Int
    }
