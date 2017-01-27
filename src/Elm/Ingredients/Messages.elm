module Ingredients.Messages exposing (..)

import Http
import Ingredients.Models exposing (..)


type Msg
    = SearchResultClicked Ingredient
    | SelectedIngredientClicked Ingredient
    | QueryChanged Query
    | OnKeyDown Int
    | SearchBlurred
    | SearchFocused
    | FetchAllDone (Result Http.Error (List BackendIngredient))
