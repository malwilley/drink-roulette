module Drinks.Update exposing (..)

import Common.Models exposing (..)
import Ingredients.Models exposing (IngredientId)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))
import Drinks.Commands exposing (getDrink)


update : Msg -> Model -> List IngredientId -> ( Model, Cmd Msg )
update msg model ids =
    case msg of
        MakeDrink ->
            ( model
                |> addPreviousDrink model.currentDrink
                |> setCurrentDrink (Just Fetching)
            , getDrink ids
            )

        LoadDrinkClick drink ->
            ( model
                |> setCurrentDrink (Just (Succeed drink))
            , Cmd.none
            )

        FetchDrinkDone (Ok drink) ->
            ( model |> setCurrentDrink (Just (Succeed drink)), Cmd.none )

        FetchDrinkDone (Err _) ->
            ( model |> setCurrentDrink (Just (Fail "Error retrieving drink info from server"))
            , Cmd.none
            )


setCurrentDrink : Maybe (HttpResult Drink) -> Model -> Model
setCurrentDrink drink model =
    { model | currentDrink = drink }


addPreviousDrink : Maybe (HttpResult Drink) -> Model -> Model
addPreviousDrink drink model =
    case drink of
        Just result ->
            case result of
                Succeed thing ->
                    { model | previousDrinks = thing :: model.previousDrinks }

                _ ->
                    model

        _ ->
            model
