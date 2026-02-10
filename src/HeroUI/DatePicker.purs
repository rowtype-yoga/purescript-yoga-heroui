module HeroUI.DatePicker where

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

type DatePickerProps r =
  ( label :: JSX
  , value :: Foreign
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , defaultValue :: Foreign
  , placeholderValue :: Foreign
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , startContent :: JSX
  , endContent :: JSX
  , labelPlacement :: LabelPlacement
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , visibleMonths :: Int
  , firstDayOfWeek :: String
  , selectionAlignment :: String
  , selectorIcon :: JSX
  , pageBehavior :: String
  , calendarWidth :: Int
  , isDateUnavailable :: Foreign
  , autoFocus :: Boolean
  , hourCycle :: Int
  , granularity :: String
  , hideTimeZone :: Boolean
  , shouldForceLeadingZeros :: Boolean
  , calendarBottomContent :: JSX
  , showMonthAndYearPickers :: Boolean
  , popoverProps :: Foreign
  , selectorButtonProps :: Foreign
  , calendarProps :: Foreign
  , timeInputProps :: Foreign
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

datePicker
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DatePickerProps () }
  => { | givenProps }
  -> kids
  -> JSX
datePicker props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.datePicker props kids

type DateRangePickerProps r =
  ( label :: JSX
  , value :: Foreign
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , minValue :: Foreign
  , maxValue :: Foreign
  , defaultValue :: Foreign
  , placeholderValue :: Foreign
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , startContent :: JSX
  , endContent :: JSX
  , startName :: String
  , endName :: String
  , labelPlacement :: LabelPlacement
  , isOpen :: Boolean
  , defaultOpen :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , selectorIcon :: JSX
  , pageBehavior :: String
  , visibleMonths :: Int
  , firstDayOfWeek :: String
  , selectionAlignment :: String
  , autoFocus :: Boolean
  , hourCycle :: Int
  , granularity :: String
  , hideTimeZone :: Boolean
  , allowsNonContiguousRanges :: Boolean
  , shouldForceLeadingZeros :: Boolean
  , calendarWidth :: Int
  , calendarTopContent :: JSX
  , calendarBottomContent :: JSX
  , showMonthAndYearPickers :: Boolean
  , popoverProps :: Foreign
  , selectorButtonProps :: Foreign
  , selectorButtonPlacement :: String
  , calendarProps :: Foreign
  , timeInputProps :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onOpenChange :: EffectFn1 Boolean Unit
  , onFocus :: EventHandler
  , onBlur :: EventHandler
  , onFocusChange :: EffectFn1 Boolean Unit
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  | r
  )

dateRangePicker
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DateRangePickerProps () }
  => { | givenProps }
  -> kids
  -> JSX
dateRangePicker props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.dateRangePicker props kids
