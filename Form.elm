import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , message : String
  , messageColor : String
  }


model : Model
model =
  Model "" "" "" "" ""


-- UPDATE

type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Submit


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    Submit ->
      if model.password == model.passwordAgain then
        {model | message = "OK", messageColor = "green"}
      else
        {model | message = "Passwords do not match!", messageColor = "red"}


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , button [ onClick Submit] [ text "Submit" ]
    , div [style [("color", model.messageColor)]] [text model.message ]
    ]
