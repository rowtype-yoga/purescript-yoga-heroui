module HeroUI.Pagination where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, Variant, colorToString, radiusToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type PaginationProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , total :: Int
  , dotsJump :: Int
  , initialPage :: Int
  , page :: Int
  , siblings :: Int
  , boundaries :: Int
  , loop :: Boolean
  , isCompact :: Boolean
  , isDisabled :: Boolean
  , showShadow :: Boolean
  , showControls :: Boolean
  , disableCursorAnimation :: Boolean
  , disableAnimation :: Boolean
  , renderItem :: Foreign
  , getItemAriaLabel :: Foreign
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Int Unit
  | r
  )

pagination
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | PaginationProps () }
  => { | givenProps }
  -> kids
  -> JSX
pagination props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString }
  Raw.pagination props kids
