module Drinks.Update exposing (..)

import Ingredients.Models exposing (IngredientId)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))
import Drinks.Commands exposing (getDrink)


update : Msg -> Model -> List IngredientId -> ( Model, Cmd Msg )
update msg model ids =
    case msg of
        MakeDrink ->
            ( model, getDrink ids )

        FetchDrinkDone (Ok drink) ->
            ( Success drink, Cmd.none )

        FetchDrinkDone (Err _) ->
            ( Error "Error retrieving drink info from server", Cmd.none )
