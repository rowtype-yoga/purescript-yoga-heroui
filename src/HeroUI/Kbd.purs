module HeroUI.Kbd where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data KbdKey
  = Command
  | Shift
  | Ctrl
  | Option
  | Enter
  | Delete
  | Escape
  | Tab
  | CapsLock
  | Up
  | Right
  | Down
  | Left
  | PageUp
  | PageDown
  | Home
  | End
  | Help
  | Space
  | Fn
  | Win
  | Alt

derive instance Eq KbdKey
derive instance Ord KbdKey

kbdKeyToString :: KbdKey -> String
kbdKeyToString = case _ of
  Command -> "command"
  Shift -> "shift"
  Ctrl -> "ctrl"
  Option -> "option"
  Enter -> "enter"
  Delete -> "delete"
  Escape -> "escape"
  Tab -> "tab"
  CapsLock -> "capslock"
  Up -> "up"
  Right -> "right"
  Down -> "down"
  Left -> "left"
  PageUp -> "pageup"
  PageDown -> "pagedown"
  Home -> "home"
  End -> "end"
  Help -> "help"
  Space -> "space"
  Fn -> "fn"
  Win -> "win"
  Alt -> "alt"

type KbdProps r =
  ( keys :: Array KbdKey
  , classNames :: Foreign
  , className :: String
  | r
  )

kbd
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | KbdProps () }
  => { | givenProps }
  -> kids
  -> JSX
kbd props kids = runFn4 createElementTransformImpl
  { keys: map kbdKeyToString :: Array KbdKey -> Array String }
  Raw.kbd props kids
