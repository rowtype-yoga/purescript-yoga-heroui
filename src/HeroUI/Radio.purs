module HeroUI.Radio where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Orientation, Size, ValidationBehavior, colorToString, orientationToString, sizeToString, validationBehaviorToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type RadioGroupProps r =
  ( label :: JSX
  , size :: Size
  , color :: Color
  , orientation :: Orientation
  , name :: String
  , value :: Foreign
  , defaultValue :: Foreign
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , isDisabled :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isInvalid :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  | r
  )

radioGroup
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | RadioGroupProps () }
  => { | givenProps }
  -> kids
  -> JSX
radioGroup props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, orientation: orientationToString, validationBehavior: validationBehaviorToString }
  Raw.radioGroup props kids

type RadioProps r =
  ( label :: JSX
  , size :: Size
  , color :: Color
  , description :: JSX
  , value :: String
  , isDisabled :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isInvalid :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  | r
  )

radio
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | RadioProps () }
  => { | givenProps }
  -> kids
  -> JSX
radio props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString }
  Raw.radio props kids
