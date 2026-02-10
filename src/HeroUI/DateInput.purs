module HeroUI.DateInput where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, Size, ValidationBehavior, Variant, colorToString, labelPlacementToString, radiusToString, sizeToString, validationBehaviorToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data Granularity = GranDay | GranHour | GranMinute | GranSecond

derive instance Eq Granularity
derive instance Ord Granularity

granularityToString :: Granularity -> String
granularityToString = case _ of
  GranDay -> "day"
  GranHour -> "hour"
  GranMinute -> "minute"
  GranSecond -> "second"

type DateInputProps r =
  ( label :: JSX
  , value :: Foreign
  , defaultValue :: Foreign
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , placeholderValue :: Foreign
  , minValue :: Foreign
  , maxValue :: Foreign
  , locale :: String
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , labelPlacement :: LabelPlacement
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , autoFocus :: Boolean
  , hideTimeZone :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onFocus :: EventHandler
  , onBlur :: EventHandler
  , onFocusChange :: EffectFn1 Boolean Unit
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  | r
  )

dateInput
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DateInputProps () }
  => { | givenProps }
  -> kids
  -> JSX
dateInput props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.dateInput props kids

type TimeInputProps r =
  ( label :: JSX
  , name :: String
  , value :: Foreign
  , defaultValue :: Foreign
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , hourCycle :: Int
  , granularity :: Granularity
  , hideTimeZone :: Boolean
  , labelPlacement :: LabelPlacement
  , shouldForceLeadingZeros :: Boolean
  , placeholderValue :: Foreign
  , minValue :: Foreign
  , maxValue :: Foreign
  , isDisabled :: Boolean
  , isReadOnly :: Boolean
  , isRequired :: Boolean
  , isInvalid :: Boolean
  , autoFocus :: Boolean
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onFocus :: EventHandler
  , onBlur :: EventHandler
  , onFocusChange :: EffectFn1 Boolean Unit
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  | r
  )

timeInput
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TimeInputProps () }
  => { | givenProps }
  -> kids
  -> JSX
timeInput props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, granularity: granularityToString, labelPlacement: labelPlacementToString, validationBehavior: validationBehaviorToString }
  Raw.timeInput props kids
