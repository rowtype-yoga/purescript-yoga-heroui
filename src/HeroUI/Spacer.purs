module HeroUI.Spacer where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElementImpl)
import HeroUI.Internal (class CoerceHeroProps)
import Data.Function.Uncurried (runFn3)
import HeroUI.Raw as Raw

type SpacerProps r =
  ( x :: Number
  , y :: Number
  , className :: String
  | r
  )

spacer
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | SpacerProps () }
  => { | givenProps }
  -> kids
  -> JSX
spacer = runFn3 createElementImpl Raw.spacer
