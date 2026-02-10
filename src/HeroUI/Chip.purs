module HeroUI.Chip where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, Variant, colorToString, radiusToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type ChipProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , avatar :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , isDisabled :: Boolean
  , classNames :: Foreign
  , className :: String
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

chip
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ChipProps () }
  => { | givenProps }
  -> kids
  -> JSX
chip props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString }
  Raw.chip props kids
