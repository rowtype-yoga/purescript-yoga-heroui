module Test.HeroUI.IssuesSpec where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Class (liftEffect)
import HeroUI.Button as Btn
import HeroUI.Drawer as Drawer
import HeroUI.Modal as Modal
import HeroUI.Provider (provider)
import HeroUI.Toast as Toast
import HeroUI.Types as T
import React.TestingLibrary (cleanup, render)
import Test.Spec (Spec, after_, describe, it)
import Test.Spec.Assertions.DOM (textContentShouldEqual)
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

