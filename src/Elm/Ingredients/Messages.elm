module Ingredients.Messages exposing (..)

import Http
import Ingredients.Models exposing (..)


type Msg
    = Toggle IngredientId
    | QueryChanged Query
    | FetchAllDone (Result Http.Error (List BackendIngredient))
