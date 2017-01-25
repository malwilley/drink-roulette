module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
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
                    Drinks.Update.update subMsg model.currentDrink (getSelectedIds model.ingredients.list)
            in
                ( { model | currentDrink = newDrink }, Cmd.map DrinkMsg cmd )


getSelectedIds : List Ingredient -> List IngredientId
getSelectedIds ingredients =
    ingredients
        |> List.filter (\i -> i.selected)
        |> List.map (\i -> i.id)
