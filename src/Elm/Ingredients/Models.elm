module Ingredients.Models exposing (..)

import Common.Models exposing (..)


init : String -> Model
init apiHost =
    { ingredients = Fetching
    , searchState = Blurred
    , searchQuery = ""
    , apiHost = apiHost
    }


type alias Model =
    { ingredients : HttpResult (List Ingredient)
    , searchState : SearchState
    , searchQuery : Query
    , apiHost : String
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
    , color : String
    , selected : Bool
    }


type SearchState
    = Editing (List Ingredient)
    | Blurred


type alias Query =
    String


getNumIngredients : Model -> Int
getNumIngredients model =
    case model.ingredients of
        Succeed ings ->
            List.length ings

        _ ->
            0


getNumSelectedIngredients : Model -> Int
getNumSelectedIngredients model =
    case model.ingredients of
        Succeed ings ->
            ings
                |> List.filter (\i -> i.selected)
                |> List.length

        _ ->
            0
