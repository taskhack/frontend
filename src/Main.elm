module Main exposing (main)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Draggable
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN
-- MODEL


type alias Model =
    { position : ( Int, Int )
    , drag : Draggable.State String
    }


init : Model
init =
    { position = ( 0, 0 )
    , drag = Draggable.init
    }



-- UPDATE


type Msg
    = OnDragBy Draggable.Delta
    | DragMsg (Draggable.Msg String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ position } as model) =
    case msg of
        OnDragBy ( dy, dx ) ->
            let
                ( x, y ) =
                    position
            in
            ( { model | position = ( round (toFloat x + dx), round (toFloat y + dy) ) }, Cmd.none )

        DragMsg dragMsg ->
            Draggable.update dragConfig dragMsg model


dragConfig : Draggable.Config String Msg
dragConfig =
    Draggable.basicConfig OnDragBy


subscriptions : Model -> Sub Msg
subscriptions { drag } =
    Draggable.subscriptions DragMsg drag



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "main-elements" ]
        [ div [ class "text" ] [ h1 [] [ text "Welcome to TaskHack" ] ]
        , div [ class "buttons" ] [ button [ Draggable.mouseTrigger "my-element" DragMsg, draggable "false" ] [ text "Getting started" ] ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view, subscriptions = subscriptions }
