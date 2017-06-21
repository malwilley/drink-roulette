module Main exposing (..)

import Html
import Models exposing (..)
import View exposing (view)
import Messages exposing (Msg(..))
import Ingredients.Commands exposing (getAllIngredients)
import Drinks.Models
import Ingredients.Models
import Update exposing (update)


type alias Flags =
    { apiHost : String }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { ingredients = Ingredients.Models.init flags.apiHost
      , currentDrink = Drinks.Models.init flags.apiHost
      , sidebar = Closed
      , apiHost = flags.apiHost
      }
    , Cmd.map IngredientsMsg (getAllIngredients flags.apiHost)
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
