module HeroUI.VisuallyHidden where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
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
  => CoerceReactProps { | givenProps } { | nonDataProps } { | VisuallyHiddenProps () }
  => { | givenProps }
  -> kids
  -> JSX
visuallyHidden = runFn3 createElementImpl Raw.visuallyHidden
