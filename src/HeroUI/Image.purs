module HeroUI.Image where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (Radius, ShadowSize, radiusToString, shadowToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data Loading = Eager | Lazy

derive instance Eq Loading
derive instance Ord Loading

loadingToString :: Loading -> String
loadingToString = case _ of
  Eager -> "eager"
  Lazy -> "lazy"

type ImageProps r =
  ( src :: String
  , srcSet :: String
  , sizes :: String
  , alt :: String
  , width :: Int
  , height :: Int
  , radius :: Radius
  , shadow :: ShadowSize
  , loading :: Loading
  , fallbackSrc :: String
  , isBlurred :: Boolean
  , isZoomed :: Boolean
  , removeWrapper :: Boolean
  , disableSkeleton :: Boolean
  , classNames :: Foreign
  , className :: String
  , onLoad :: EventHandler
  , onError :: EventHandler
  | r
  )

image
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ImageProps () }
  => { | givenProps }
  -> kids
  -> JSX
image props kids = runFn4 createElementTransformImpl
  { radius: radiusToString, shadow: shadowToString, loading: loadingToString }
  Raw.image props kids
