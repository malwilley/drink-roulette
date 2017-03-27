module Drinks.Models exposing (..)

import Common.Models exposing (..)
import Ingredients.Models exposing (Ingredient)


init : Model
init =
    { currentDrink = Nothing
    , previousDrinks = []
    }


type alias Model =
    { currentDrink : Maybe (HttpResult Drink)
    , previousDrinks : List Drink
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
