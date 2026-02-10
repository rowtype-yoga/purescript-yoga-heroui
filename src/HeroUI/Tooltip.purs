module HeroUI.Tooltip where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Placement, Radius, ShadowSize, Size, colorToString, placementToString, radiusToString, shadowToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type TooltipProps r =
  ( content :: JSX
  , size :: Size
  , color :: Color
  , radius :: Radius
  , shadow :: ShadowSize
  , placement :: Placement
  , delay :: Int
  , closeDelay :: Int
  , isOpen :: Boolean
  , defaultOpen :: Boolean
  , offset :: Int
  , containerPadding :: Int
  , crossOffset :: Int
  , showArrow :: Boolean
  , shouldFlip :: Boolean
  , triggerScaleOnOpen :: Boolean
  , isKeyboardDismissDisabled :: Boolean
  , isDismissable :: Boolean
  , shouldCloseOnBlur :: Boolean
  , motionProps :: Foreign
  , portalContainer :: Foreign
  , updatePositionDeps :: Foreign
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onOpenChange :: EffectFn1 Boolean Unit
  , shouldCloseOnInteractOutside :: Foreign
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

tooltip
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TooltipProps () }
  => { | givenProps }
  -> kids
  -> JSX
tooltip props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString, shadow: shadowToString, placement: placementToString }
  Raw.tooltip props kids
