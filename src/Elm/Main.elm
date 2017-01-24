module Main exposing (..)

import Html

import Models exposing (..)
import View exposing (view)
import Messages exposing (Msg(..))
import Ingredients.Commands exposing (getAllIngredients)
import Drinks.Models
import Update exposing (update)

init : (Model, Cmd Msg)
init =
  ( { ingredients = 
        { list = []
        , searchFocus = False
        , searchQuery = ""
      }
    , currentDrink = Drinks.Models.NoDrink }
  , Cmd.map IngredientsMsg getAllIngredients )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main: Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }
