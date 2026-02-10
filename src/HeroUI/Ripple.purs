module HeroUI.Ripple where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3)
import HeroUI.Raw as Raw

type RippleProps r =
  ( className :: String
  | r
  )

ripple
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | RippleProps () }
  => { | givenProps }
  -> kids
  -> JSX
ripple = runFn3 createElementImpl Raw.ripple
