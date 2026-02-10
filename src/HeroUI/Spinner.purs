module HeroUI.Spinner where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (Color, Size, colorToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data SpinnerVariant = SpinDefault | SpinSimple | SpinGradient | SpinWave | SpinDots | SpinSpinner

derive instance Eq SpinnerVariant
derive instance Ord SpinnerVariant

spinnerVariantToString :: SpinnerVariant -> String
spinnerVariantToString = case _ of
  SpinDefault -> "default"
  SpinSimple -> "simple"
  SpinGradient -> "gradient"
  SpinWave -> "wave"
  SpinDots -> "dots"
  SpinSpinner -> "spinner"

type SpinnerProps r =
  ( label :: String
  , size :: Size
  , color :: Color
  , variant :: SpinnerVariant
  , labelColor :: Color
  , classNames :: Foreign
  , className :: String
  | r
  )

spinner
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SpinnerProps () }
  => { | givenProps }
  -> kids
  -> JSX
spinner props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, variant: spinnerVariantToString, labelColor: colorToString }
  Raw.spinner props kids
