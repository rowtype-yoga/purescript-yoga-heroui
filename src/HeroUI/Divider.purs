module HeroUI.Divider where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import HeroUI.Types (Orientation, orientationToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type DividerProps r =
  ( orientation :: Orientation
  , className :: String
  | r
  )

divider
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DividerProps () }
  => { | givenProps }
  -> kids
  -> JSX
divider props kids = runFn4 createElementTransformImpl
  { orientation: orientationToString }
  Raw.divider props kids
