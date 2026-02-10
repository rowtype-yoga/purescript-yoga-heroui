module HeroUI.Checkbox where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Orientation, Radius, Size, ValidationBehavior, colorToString, orientationToString, radiusToString, sizeToString, validationBehaviorToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type CheckboxProps r =
  ( icon :: Foreign
  , value :: String
  , name :: String
  , size :: Size
  , color :: Color
  , radius :: Radius
  , lineThrough :: Boolean
  , isSelected :: Boolean
  , defaultSelected :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isIndeterminate :: Boolean
  , isInvalid :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 Boolean Unit
  | r
  )

checkbox
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CheckboxProps () }
  => { | givenProps }
  -> kids
  -> JSX
checkbox props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString }
  Raw.checkbox props kids

type CheckboxGroupProps r =
  ( orientation :: Orientation
  , color :: Color
  , size :: Size
  , radius :: Radius
  , name :: String
  , label :: String
  , value :: Foreign
  , defaultValue :: Foreign
  , lineThrough :: Boolean
  , isInvalid :: Boolean
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , isDisabled :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 Foreign Unit
  | r
  )

checkboxGroup
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CheckboxGroupProps () }
  => { | givenProps }
  -> kids
  -> JSX
checkboxGroup props kids = runFn4 createElementTransformImpl
  { orientation: orientationToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString }
  Raw.checkboxGroup props kids
