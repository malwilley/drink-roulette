module Drinks.Models exposing (..)

import Ingredients.Models exposing (Ingredient)


init : Model
init =
    NoDrink


type Model
    = Success Drink
    | Error String
    | NoDrink


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
