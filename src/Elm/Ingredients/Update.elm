module Ingredients.Update exposing (..)

import Regex exposing (regex, caseInsensitive)
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchResultClicked ingredient ->
            ( model
                |> toggleIngredient ingredient
                |> setQuery ""
            , Cmd.none
            )

        SelectedIngredientClicked ingredient ->
            ( model
                |> toggleIngredient ingredient
            , Cmd.none
            )

        QueryChanged query ->
            ( model
                |> setQuery query
                |> setEditingState
            , Cmd.none
            )

        OnKeyDown key ->
            if key == 13 then
                case model.searchState of
                    Editing ingredients ->
                        case ingredients of
                            hd :: tl ->
                                ( model
                                    |> toggleIngredient hd
                                    |> setQuery ""
                                , Cmd.none
                                )

                            [] ->
                                ( model, Cmd.none )

                    _ ->
                        ( model, Cmd.none )
            else
                ( model, Cmd.none )

        SearchBlurred ->
            ( { model | searchState = Blurred }, Cmd.none )

        SearchFocused ->
            ( setEditingState model, Cmd.none )

        FetchAllDone (Ok newIngredients) ->
            ( { model | list = List.filterMap backendIngredientToIngredient newIngredients }, Cmd.none )

        FetchAllDone (Err _) ->
            ( model, Cmd.none )


setQuery : Query -> Model -> Model
setQuery query model =
    { model | searchQuery = query }


setEditingState : Model -> Model
setEditingState model =
    { model | searchState = Editing (getSearchResults model.list model.searchQuery) }


getSearchResults : List Ingredient -> Query -> List Ingredient
getSearchResults options query =
    case query of
        "" ->
            []

        query ->
            options
                |> List.filter (\i -> Regex.contains (caseInsensitive (regex query)) i.name)
                |> List.filter (\i -> not i.selected)
                |> List.sortWith (sortByQuery query)
                |> List.take 5


sortByQuery : Query -> Ingredient -> Ingredient -> Order
sortByQuery query ing1 ing2 =
    let
        length1 =
            String.length ing1.name

        length2 =
            String.length ing2.name
    in
        if length1 == length2 then
            EQ
        else if length1 > length2 then
            GT
        else
            LT


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


toggleIngredient : Ingredient -> Model -> Model
toggleIngredient ingredient model =
    { model | list = List.map (toggleMatch ingredient) model.list }


toggleMatch : Ingredient -> Ingredient -> Ingredient
toggleMatch ingredient1 ingredient2 =
    if ingredient1.id == ingredient2.id then
        { ingredient2 | selected = not ingredient2.selected }
    else
        ingredient2
