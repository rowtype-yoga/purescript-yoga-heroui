module HeroUI.Badge where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (Color, Placement, Size, Variant, colorToString, placementToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data Shape = Circle | Rectangle

derive instance Eq Shape
derive instance Ord Shape

shapeToString :: Shape -> String
shapeToString = case _ of
  Circle -> "circle"
  Rectangle -> "rectangle"

type BadgeProps r =
  ( content :: JSX
  , variant :: Variant
  , color :: Color
  , size :: Size
  , shape :: Shape
  , placement :: Placement
  , showOutline :: Boolean
  , disableOutline :: Boolean
  , disableAnimation :: Boolean
  , isInvisible :: Boolean
  , isOneChar :: Boolean
  , isDot :: Boolean
  , classNames :: Foreign
  , className :: String
  | r
  )

badge
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | BadgeProps () }
  => { | givenProps }
  -> kids
  -> JSX
badge props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, shape: shapeToString, placement: placementToString }
  Raw.badge props kids
