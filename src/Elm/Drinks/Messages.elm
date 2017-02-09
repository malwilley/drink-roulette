module Drinks.Messages exposing (..)

import Http
import Drinks.Models exposing (..)


type Msg
    = MakeDrink
    | FetchDrinkDone (Result Http.Error Drink)
