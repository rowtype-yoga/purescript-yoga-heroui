module HeroUI.Progress where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, colorToString, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type ProgressProps r =
  ( label :: JSX
  , size :: Size
  , color :: Color
  , radius :: Radius
  , value :: Number
  , valueLabel :: JSX
  , minValue :: Number
  , maxValue :: Number
  , formatOptions :: Foreign
  , isIndeterminate :: Boolean
  , isStriped :: Boolean
  , showValueLabel :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  | r
  )

progress
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ProgressProps () }
  => { | givenProps }
  -> kids
  -> JSX
progress props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString }
  Raw.progress props kids

type CircularProgressProps r =
  ( label :: JSX
  , size :: Size
  , color :: Color
  , value :: Number
  , valueLabel :: JSX
  , minValue :: Number
  , maxValue :: Number
  , formatOptions :: Foreign
  , isIndeterminate :: Boolean
  , showValueLabel :: Boolean
  , strokeWidth :: Number
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  | r
  )

circularProgress
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CircularProgressProps () }
  => { | givenProps }
  -> kids
  -> JSX
circularProgress props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString }
  Raw.circularProgress props kids
