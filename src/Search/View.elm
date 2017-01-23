module Search.View exposing (viewSearchBar)
import Debug
import String
import Html exposing (..)
import Html.Attributes exposing (class, style, type_, placeholder)
import Html.Events exposing (onInput)

import Ingredients.Models exposing (Ingredient)
import Search.Models exposing (..)
import Search.Messages exposing (Msg(..))

viewSearchBar : Model -> Html Msg
viewSearchBar model =
  div []
  [ inputView
  , resultsView model.options model.query
  ]

inputView : Html Msg
inputView =
  input [ class "search-bar", type_ "search", onInput QueryChanged
  , placeholder "Search for an ingredient"] []

resultsView : IngredientOptions -> Query -> Html Msg
resultsView options query =
  ul [ class "search-results" ]
  ( getSearchResults options query
    |> List.map (\i -> li[][ text i.name ]) )


getSearchResults : IngredientOptions -> Query -> IngredientOptions
getSearchResults options query =
  let
    maxResults = 5
  in
    options
    |> Debug.log "options"
    |> List.sortWith (queryCompare query)
    |> List.take maxResults


{-| Returns a sort function for comparing ingredients based on search query -}
queryCompare : Query -> Ingredient -> Ingredient -> Order
queryCompare query ingredient1 ingredient2 =
  let
    l1 = levenshtein query ingredient1.name
    l2 = levenshtein query ingredient2.name
  in
    compare l1 l2

{-| Returns the Levenshtein distance for two strings -}
levenshtein : Query -> String -> Int
levenshtein query str =
  let
    q = String.uncons query
    s = String.uncons str
  in
    case (q, s) of
      (Nothing, Nothing) ->
        0
      (Nothing, Just (sHead, sTail)) ->
        String.length sTail + 1
      (Just (qHead, qTail), Nothing) ->
        String.length qTail + 1
      (Just (qHead, qTail), Just (sHead, sTail)) ->
        if qHead == sHead then
          levenshtein qTail sTail
        else
          levenshtein qTail sTail + 1
