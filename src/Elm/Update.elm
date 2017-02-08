module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Common.Models exposing (..)
import Ingredients.Models exposing (IngredientId, Ingredient)
import Ingredients.Update
import Drinks.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        IngredientsMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Ingredients.Update.update subMsg model.ingredients
            in
                ( { model | ingredients = updatedModel }, Cmd.map IngredientsMsg cmd )

        DrinkMsg subMsg ->
            let
                ( newDrink, cmd ) =
                    Drinks.Update.update subMsg model.currentDrink (getSelectedIds model.ingredients)
            in
                ( { model | currentDrink = newDrink }, Cmd.map DrinkMsg cmd )


getSelectedIds : Ingredients.Models.Model -> List IngredientId
getSelectedIds ingModel =
    case ingModel.ingredients of
        Succeed ingredients ->
            ingredients
                |> List.filter (\i -> i.selected)
                |> List.map (\i -> i.id)

        Fetching ->
            []

        Fail _ ->
            []
