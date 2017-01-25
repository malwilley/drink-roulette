module Ingredients.Update exposing (..)

import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ingredientId ->
            ( { model | list = List.map (toggleItem ingredientId) model.list }, Cmd.none )

        QueryChanged query ->
            ( { model | searchQuery = query }, Cmd.none )

        FetchAllDone (Ok newIngredients) ->
            ( { model | list = List.filterMap backendIngredientToIngredient newIngredients }, Cmd.none )

        FetchAllDone (Err _) ->
            ( model, Cmd.none )


backendIngredientToIngredient : BackendIngredient -> Maybe Ingredient
backendIngredientToIngredient backendIngredient =
    let
        cat =
            intToCategory backendIngredient.category
    in
        case cat of
            Just cat ->
                Just
                    { id = backendIngredient.id
                    , name = backendIngredient.name
                    , category = cat
                    , selected = False
                    }

            Nothing ->
                Nothing


intToCategory : Int -> Maybe Category
intToCategory num =
    case num of
        0 ->
            Just Alcohol

        1 ->
            Just Mixer

        2 ->
            Just Other

        _ ->
            Nothing


toggleItem : IngredientId -> Ingredient -> Ingredient
toggleItem ingredientId ingredient =
    if ingredient.id == ingredientId then
        { ingredient | selected = not ingredient.selected }
    else
        ingredient
