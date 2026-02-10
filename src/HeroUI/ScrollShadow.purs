module HeroUI.ScrollShadow where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Orientation, orientationToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data ScrollShadowVisibility = VisAuto | VisTop | VisBottom | VisLeft | VisRight | VisBoth | VisNone

derive instance Eq ScrollShadowVisibility
derive instance Ord ScrollShadowVisibility

scrollShadowVisibilityToString :: ScrollShadowVisibility -> String
scrollShadowVisibilityToString = case _ of
  VisAuto -> "auto"
  VisTop -> "top"
  VisBottom -> "bottom"
  VisLeft -> "left"
  VisRight -> "right"
  VisBoth -> "both"
  VisNone -> "none"

type ScrollShadowProps r =
  ( size :: Int
  , offset :: Int
  , hideScrollBar :: Boolean
  , orientation :: Orientation
  , isEnabled :: Boolean
  , visibility :: ScrollShadowVisibility
  , className :: String
  , onVisibilityChange :: EffectFn1 Foreign Unit
  | r
  )

scrollShadow
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ScrollShadowProps () }
  => { | givenProps }
  -> kids
  -> JSX
scrollShadow props kids = runFn4 createElementTransformImpl
  { orientation: orientationToString, visibility: scrollShadowVisibilityToString }
  Raw.scrollShadow props kids
