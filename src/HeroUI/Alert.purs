module HeroUI.Alert where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Variant, colorToString, radiusToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type AlertProps r =
  ( title :: JSX
  , icon :: JSX
  , description :: JSX
  , color :: Color
  , variant :: Variant
  , radius :: Radius
  , startContent :: JSX
  , endContent :: JSX
  , isVisible :: Boolean
  , isClosable :: Boolean
  , hideIcon :: Boolean
  , hideIconWrapper :: Boolean
  , closeButtonProps :: Foreign
  , classNames :: Foreign
  , className :: String
  , onClose :: EffectFn1 Foreign Unit
  , onVisibleChange :: EffectFn1 Boolean Unit
  | r
  )

alert
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AlertProps () }
  => { | givenProps }
  -> kids
  -> JSX
alert props kids = runFn4 createElementTransformImpl
  { color: colorToString, variant: variantToString, radius: radiusToString }
  Raw.alert props kids
