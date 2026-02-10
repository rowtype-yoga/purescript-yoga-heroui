module HeroUI.NumberInput where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, Size, ValidationBehavior, Variant, colorToString, labelPlacementToString, radiusToString, sizeToString, validationBehaviorToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type NumberInputProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , name :: String
  , label :: JSX
  , description :: JSX
  , value :: String
  , defaultValue :: String
  , placeholder :: String
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , minValue :: Number
  , maxValue :: Number
  , formatOptions :: Foreign
  , step :: Number
  , hideStepper :: Boolean
  , isWheelDisabled :: Boolean
  , startContent :: JSX
  , endContent :: JSX
  , labelPlacement :: LabelPlacement
  , fullWidth :: Boolean
  , isClearable :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , incrementAriaLabel :: String
  , decrementAriaLabel :: String
  , baseRef :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 Number Unit
  , onClear :: EffectFn1 Foreign Unit
  | r
  )

numberInput
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NumberInputProps () }
  => { | givenProps }
  -> kids
  -> JSX
numberInput props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.numberInput props kids
