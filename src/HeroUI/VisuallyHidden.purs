module HeroUI.VisuallyHidden where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElementImpl)
import HeroUI.Internal (class CoerceHeroProps)
import Data.Function.Uncurried (runFn3)
import HeroUI.Raw as Raw

type VisuallyHiddenProps r =
  ( elementType :: String
  , className :: String
  | r
  )

visuallyHidden
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | VisuallyHiddenProps () }
  => { | givenProps }
  -> kids
  -> JSX
visuallyHidden = runFn3 createElementImpl Raw.visuallyHidden
