module Drinks.Models exposing (..)

import Common.Models exposing (..)
import Ingredients.Models exposing (Ingredient)


init : String -> Model
init apiHost =
    { currentDrink = Nothing
    , previousDrinks = []
    , apiHost = apiHost
    }


type alias Model =
    { currentDrink : Maybe (HttpResult Drink)
    , previousDrinks : List Drink
    , apiHost : String
    }


type DrinkSize
    = Shot
    | Pint
    | Cup
    | Buttchug


type alias IngredientProportion =
    { ingredient : Ingredient
    , proportion : Float
    }


type alias Drink =
    { name : String
    , ingredients : List IngredientProportion
    , size : DrinkSize
    }


getNumDrinks : Model -> Int
getNumDrinks model =
    List.length model.previousDrinks
