module HeroUI.Switch where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Size, colorToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type SwitchProps r =
  ( value :: String
  , name :: String
  , size :: Size
  , color :: Color
  , thumbIcon :: Foreign
  , startContent :: JSX
  , endContent :: JSX
  , isSelected :: Boolean
  , defaultSelected :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 Boolean Unit
  | r
  )

switch_
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SwitchProps () }
  => { | givenProps }
  -> kids
  -> JSX
switch_ props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString }
  Raw.switch_ props kids
