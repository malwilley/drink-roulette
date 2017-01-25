module Main exposing (..)

import Html
import Models exposing (..)
import View exposing (view)
import Messages exposing (Msg(..))
import Ingredients.Commands exposing (getAllIngredients)
import Drinks.Models
import Ingredients.Models
import Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( { ingredients = Ingredients.Models.init
      , currentDrink = Drinks.Models.init
      }
    , Cmd.map IngredientsMsg getAllIngredients
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
