module HeroUI.Calendar where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Align, Color, alignToString, colorToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data PageBehavior = PageSingle | PageVisible

derive instance Eq PageBehavior
derive instance Ord PageBehavior

pageBehaviorToString :: PageBehavior -> String
pageBehaviorToString = case _ of
  PageSingle -> "single"
  PageVisible -> "visible"

data WeekdayStyle = WeekdayNarrow | WeekdayShort | WeekdayLong

derive instance Eq WeekdayStyle
derive instance Ord WeekdayStyle

weekdayStyleToString :: WeekdayStyle -> String
weekdayStyleToString = case _ of
  WeekdayNarrow -> "narrow"
  WeekdayShort -> "short"
  WeekdayLong -> "long"

data FirstDayOfWeek = Sun | Mon | Tue | Wed | Thu | Fri | Sat

derive instance Eq FirstDayOfWeek
derive instance Ord FirstDayOfWeek

firstDayOfWeekToString :: FirstDayOfWeek -> String
firstDayOfWeekToString = case _ of
  Sun -> "sun"
  Mon -> "mon"
  Tue -> "tue"
  Wed -> "wed"
  Thu -> "thu"
  Fri -> "fri"
  Sat -> "sat"

type CalendarProps r =
  ( value :: Foreign
  , defaultValue :: Foreign
  , minValue :: Foreign
  , maxValue :: Foreign
  , color :: Color
  , visibleMonths :: Int
  , firstDayOfWeek :: FirstDayOfWeek
  , selectionAlignment :: Align
  , focusedValue :: Foreign
  , defaultFocusedValue :: Foreign
  , calendarWidth :: Foreign
  , pageBehavior :: PageBehavior
  , weekdayStyle :: WeekdayStyle
  , showMonthAndYearPickers :: Boolean
  , isDisabled :: Boolean
  , isReadOnly :: Boolean
  , isInvalid :: Boolean
  , autoFocus :: Boolean
  , showHelper :: Boolean
  , showShadow :: Boolean
  , isHeaderExpanded :: Boolean
  , isHeaderDefaultExpanded :: Boolean
  , topContent :: JSX
  , bottomContent :: JSX
  , isDateUnavailable :: Foreign
  , createCalendar :: Foreign
  , errorMessage :: JSX
  , hideDisabledDates :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onFocusChange :: EffectFn1 Foreign Unit
  , onHeaderExpandedChange :: EffectFn1 Boolean Unit
  | r
  )

calendar
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CalendarProps () }
  => { | givenProps }
  -> kids
  -> JSX
calendar props kids = runFn4 createElementTransformImpl
  { color: colorToString, firstDayOfWeek: firstDayOfWeekToString, selectionAlignment: alignToString, pageBehavior: pageBehaviorToString, weekdayStyle: weekdayStyleToString }
  Raw.calendar props kids

type RangeCalendarProps r =
  ( value :: Foreign
  , defaultValue :: Foreign
  , minValue :: Foreign
  , maxValue :: Foreign
  , color :: Color
  , visibleMonths :: Int
  , firstDayOfWeek :: FirstDayOfWeek
  , selectionAlignment :: Align
  , focusedValue :: Foreign
  , defaultFocusedValue :: Foreign
  , calendarWidth :: Foreign
  , pageBehavior :: PageBehavior
  , weekdayStyle :: WeekdayStyle
  , showMonthAndYearPickers :: Boolean
  , allowsNonContiguousRanges :: Boolean
  , isDisabled :: Boolean
  , isReadOnly :: Boolean
  , isInvalid :: Boolean
  , autoFocus :: Boolean
  , showHelper :: Boolean
  , showShadow :: Boolean
  , topContent :: JSX
  , bottomContent :: JSX
  , isDateUnavailable :: Foreign
  , createCalendar :: Foreign
  , errorMessage :: JSX
  , validate :: Foreign
  , hideDisabledDates :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onFocusChange :: EffectFn1 Foreign Unit
  | r
  )

rangeCalendar
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | RangeCalendarProps () }
  => { | givenProps }
  -> kids
  -> JSX
rangeCalendar props kids = runFn4 createElementTransformImpl
  { color: colorToString, firstDayOfWeek: firstDayOfWeekToString, selectionAlignment: alignToString, pageBehavior: pageBehaviorToString, weekdayStyle: weekdayStyleToString }
  Raw.rangeCalendar props kids
