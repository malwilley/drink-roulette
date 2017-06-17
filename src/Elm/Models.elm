module Models exposing (..)

import Ingredients.Models
import Drinks.Models


type alias Model =
    { ingredients : Ingredients.Models.Model
    , currentDrink : Drinks.Models.Model
    , sidebar : Sidebar
    }


type Sidebar
    = Ingredients
    | History
    | Closed