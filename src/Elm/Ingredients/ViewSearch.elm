module Ingredients.ViewSearch exposing (viewSearchBar)

import String
import Regex exposing (regex, caseInsensitive)
import Html exposing (..)
import Html.Attributes exposing (class, style, type_, placeholder)
import Html.Events exposing (onInput, onClick)
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (Msg(..))


viewSearchBar : Model -> Html Msg
viewSearchBar model =
    div []
        [ inputView
        , div [] [ resultsView model.list model.searchQuery ]
        ]


inputView : Html Msg
inputView =
    input
        [ class "search-bar"
        , type_ "search"
        , onInput QueryChanged
        , placeholder "Search for an ingredient"
        ]
        []


resultsView : List Ingredient -> Query -> Html Msg
resultsView options query =
    div [ class "relative" ]
        [ ul [ class "search-results-container" ]
            (resultItemsView options query)
        ]


resultItemsView : List Ingredient -> Query -> List (Html Msg)
resultItemsView options query =
    case query of
        "" ->
            []

        query ->
            let
                results =
                    getSearchResults options query
            in
                case results of
                    [] ->
                        [ li [] [ text "No results" ] ]

                    results ->
                        results
                            |> List.map resultItemView


resultItemView : Ingredient -> Html Msg
resultItemView ingredient =
    li [ onClick (Toggle ingredient.id) ] [ text ingredient.name ]


getSearchResults : List Ingredient -> Query -> List Ingredient
getSearchResults options query =
    let
        maxResults =
            5
    in
        options
            |> List.filter (\i -> Regex.contains (caseInsensitive (regex query)) i.name)
            |> List.filter (\i -> not i.selected)
            |> List.sortWith (sortByQuery query)
            |> List.take maxResults


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


{-| Returns the Levenshtein distance for two strings
-}
levenshtein : Query -> String -> Int
levenshtein query str =
    let
        q =
            String.uncons query

        s =
            String.uncons str
    in
        case ( q, s ) of
            ( Nothing, Nothing ) ->
                0

            ( Nothing, Just ( sHead, sTail ) ) ->
                String.length sTail + 1

            ( Just ( qHead, qTail ), Nothing ) ->
                String.length qTail + 1

            ( Just ( qHead, qTail ), Just ( sHead, sTail ) ) ->
                if qHead == sHead then
                    levenshtein qTail sTail
                else
                    levenshtein qTail sTail + 1
