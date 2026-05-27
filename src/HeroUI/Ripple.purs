module HeroUI.Ripple where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElementImpl)
import HeroUI.Internal (class CoerceHeroProps)
import Data.Function.Uncurried (runFn3)
import HeroUI.Raw as Raw

type RippleProps r =
  ( className :: String
  | r
  )

ripple
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | RippleProps () }
  => { | givenProps }
  -> kids
  -> JSX
ripple = runFn3 createElementImpl Raw.ripple
