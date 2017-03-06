module Drinks.Messages exposing (..)

import Http
import Drinks.Models exposing (..)


type Msg
    = MakeDrink
    | LoadDrinkClick Drink
    | FetchDrinkDone (Result Http.Error Drink)
