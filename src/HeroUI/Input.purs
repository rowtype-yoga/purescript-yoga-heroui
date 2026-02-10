module HeroUI.Input where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, Size, ValidationBehavior, Variant, colorToString, labelPlacementToString, radiusToString, sizeToString, validationBehaviorToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type InputProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , label :: JSX
  , value :: String
  , defaultValue :: String
  , placeholder :: String
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , startContent :: JSX
  , endContent :: JSX
  , labelPlacement :: LabelPlacement
  , fullWidth :: Boolean
  , isClearable :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , baseRef :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , type :: String
  , name :: String
  , minLength :: Int
  , maxLength :: Int
  , pattern :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  , onClear :: EffectFn1 Foreign Unit
  | r
  )

input
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | InputProps () }
  => { | givenProps }
  -> kids
  -> JSX
input props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.input props kids

type TextareaProps r =
  ( minRows :: Int
  , maxRows :: Int
  , cacheMeasurements :: Boolean
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , label :: JSX
  , value :: String
  , defaultValue :: String
  , placeholder :: String
  , startContent :: JSX
  , endContent :: JSX
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , labelPlacement :: LabelPlacement
  , fullWidth :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isClearable :: Boolean
  , isInvalid :: Boolean
  , disableAutosize :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , name :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  , onClear :: EffectFn1 Foreign Unit
  , onHeightChange :: EffectFn1 Foreign Unit
  | r
  )

textarea
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TextareaProps () }
  => { | givenProps }
  -> kids
  -> JSX
textarea props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.textarea props kids
