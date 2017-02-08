module Ingredients.Models exposing (..)

import Common.Models exposing (..)


init : Model
init =
    { ingredients = Fetching
    , searchState = Blurred
    , searchQuery = ""
    }


type alias Model =
    { ingredients : HttpResult (List Ingredient)
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
