module Drinks.Messages exposing (..)

import Http
import Drinks.Models exposing (BackendDrink)


type Msg
    = MakeDrink
    | FetchDrinkDone (Result Http.Error BackendDrink)
