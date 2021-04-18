module HomePage  exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Nothing


update : Msg -> Model -> Model
update msg model =
  model + 1


-- VIEW


view : Model -> Html Msg
view model =
  div [ class "main-elements" ]
    [  div[ class "text" ] [ h1 [] [ text "Welcome to TaskHack" ] ] 
    , div[ class "buttons" ] [ button [onClick Nothing] [ text "Getting started" ] ]  
    ]



