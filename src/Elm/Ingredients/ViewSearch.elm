module Ingredients.ViewSearch exposing (viewSearchBar)

import String
import Html exposing (..)
import Html.Attributes exposing (class, style, type_, placeholder, value)
import Html.Events exposing (on, onInput, onClick, onFocus, onBlur, keyCode)
import Json.Decode
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (Msg(..))


viewSearchBar : Model -> Html Msg
viewSearchBar model =
    div []
        [ inputView model
        , div [] [ resultsView model ]
        ]


inputView : Model -> Html Msg
inputView model =
    div [ class "search-bar flex flex-center flex-stretch" ]
        [ div [ class "search-icon-container fa fa-search p2" ] []
        , input
            [ class "flex-auto"
            , type_ "search"
            , value model.searchQuery
            , onKeyDown OnKeyDown
            , onInput QueryChanged
            , onFocus SearchFocused
            , onBlur SearchBlurred
            , placeholder "Search for an ingredient"
            ]
            []
        ]


resultsView : Model -> Html Msg
resultsView model =
    div [ class "relative" ]
        [ ul [ class "search-results-container" ]
            (case model.searchState of
                Blurred ->
                    []

                Editing results ->
                    case model.searchQuery of
                        "" ->
                            []

                        _ ->
                            resultItemsView results
            )
        ]


resultItemsView : List Ingredient -> List (Html Msg)
resultItemsView results =
    case results of
        [] ->
            [ div [ class "ml2 p1 left" ] [ text "No results" ] ]

        results ->
            results
                |> List.map resultItemView


resultItemView : Ingredient -> Html Msg
resultItemView ingredient =
    li
        [ class "flex flex-center"
        , onClick (SearchResultClicked ingredient)
        ]
        [ div [ class "search-icon-container fa fa-glass p2" ] []
        , div [ class "search-text flex-auto" ] [ text ingredient.name ]
        ]


onKeyDown : (Int -> Msg) -> Attribute Msg
onKeyDown tagger =
    on "keydown" (Json.Decode.map tagger keyCode)


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
