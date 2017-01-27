module Ingredients.Models exposing (..)


init : Model
init =
    { list = []
    , searchState = Blurred
    , searchQuery = ""
    }


type alias Model =
    { list : List Ingredient
    , searchState : SearchState
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


type SearchState
    = Editing (List Ingredient)
    | Blurred


type alias Query =
    String


type alias BackendIngredient =
    { id : Int
    , name : String
    , category : Int
    }
