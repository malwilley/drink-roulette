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

        IngSidebarToggle ->
            ( model
                |> updateToggledSidebarState Ingredients
            , Cmd.none
            )

        HistorySidebarToggle ->
            ( model
                |> updateToggledSidebarState History
            , Cmd.none
            )


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


updateToggledSidebarState : Sidebar -> Model -> Model
updateToggledSidebarState toggledSidebar model =
    if toggledSidebar == model.sidebar then
        { model | sidebar = Closed }
    else
        { model | sidebar = toggledSidebar }
