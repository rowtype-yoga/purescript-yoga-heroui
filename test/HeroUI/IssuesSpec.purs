module Test.HeroUI.IssuesSpec where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Class (liftEffect)
import HeroUI.Button as Btn
import HeroUI.Drawer as Drawer
import HeroUI.Hooks as Hooks
import HeroUI.Input as Input
import HeroUI.Modal as Modal
import HeroUI.NumberInput as NumberInput
import HeroUI.Provider (provider)
import HeroUI.Toast as Toast
import HeroUI.Types as T
import React.Basic.Hooks as React
import React.TestingLibrary (cleanup, render)
import Test.Spec (Spec, after_, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Assertions.DOM (textContentShouldEqual)
import Unsafe.Coerce (unsafeCoerce)
import Yoga.React (component)
import Yoga.React.DOM.Internal (text)

spec :: Spec Unit
spec = after_ cleanup $ describe "purescript-yoga-heroui issue #1" do
  it "Button accepts a `type` prop" do
    { findByText } <- render submitButton
    btn <- findByText "Submit"
    btn `textContentShouldEqual` "Submit"

  it "Modal accepts extended sizes (e.g. 2xl)" do
    { findByText } <- render bigModal
    body <- findByText "modal body"
    body `textContentShouldEqual` "modal body"

  it "Drawer accepts extended sizes (e.g. 5xl)" do
    { findByText } <- render bigDrawer
    body <- findByText "drawer body"
    body `textContentShouldEqual` "drawer body"

  it "Toast exposes addToast/closeToast/closeAllToasts" do
    _ <- render toastHost
    mId <- liftEffect $ Toast.addToast { title: text "hi" }
    case mId of
      Just id -> liftEffect $ Toast.closeToast id
      Nothing -> pure unit
    liftEffect Toast.closeAllToasts

  it "Aria props compile and reach the DOM" do
    { findByLabelText } <- render ariaButton
    el <- findByLabelText "close dialog"
    el `textContentShouldEqual` "X"

  it "useDisclosure exposes isOpen + onOpen/onClose" do
    { findByText } <- render disclosureHost
    initial <- findByText "closed"
    initial `textContentShouldEqual` "closed"

  it "NumberInput accepts numeric value/defaultValue" do
    { findByLabelText } <- render numberInputHost
    el <- findByLabelText "qty"
    -- input is rendered; numeric value bound without compile error
    _ <- pure el
    pure unit

  it "Input accepts native HTML attrs (autoComplete/form/id) and InputType ADT" do
    { findByLabelText } <- render inputHost
    el <- findByLabelText "email"
    _ <- pure el
    pure unit

  it "InputType strings round-trip" do
    Input.inputTypeToString Input.InputTypeEmail `shouldEqual` "email"
    Input.inputTypeToString Input.InputTypeDateTimeLocal `shouldEqual` "datetime-local"

submitButton = provider {}
  [ Btn.button { type: Btn.ButtonTypeSubmit } (text "Submit") ]

bigModal = provider {}
  [ Modal.modal { isOpen: true, size: T.ModalSize2xl }
      [ Modal.modalBody {} (text "modal body") ]
  ]

bigDrawer = provider {}
  [ Drawer.drawer { isOpen: true, size: T.ModalSize5xl }
      [ Drawer.drawerBody {} (text "drawer body") ]
  ]

ariaButton = provider {}
  [ Btn.button { "aria-label": "close dialog" } (text "X") ]

toastHost = provider {}
  [ Toast.toastProvider {} ([] :: Array _) ]

disclosureHost = provider {} [ disclosureComponent {} ]

disclosureComponent = component "DisclosureHost" \(_ :: {}) -> React.do
  d <- Hooks.useDisclosure {}
  pure $ text (if d.isOpen then "open" else "closed")

numberInputHost = provider {}
  [ NumberInput.numberInput
      { label: text "qty"
      , defaultValue: 1.0
      , minValue: 0.0
      , maxValue: 10.0
      }
      ([] :: Array _)
  ]

inputHost = provider {}
  [ Input.input
      { label: text "email"
      , type: Input.InputTypeEmail
      , name: "email"
      , id: "email-field"
      , form: "signup"
      , autoComplete: "email"
      , autoFocus: false
      }
      ([] :: Array _)
  ]

