module HeroUI.Code where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import HeroUI.Types (Color, Radius, Size, colorToString, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type CodeProps r =
  ( size :: Size
  , color :: Color
  , radius :: Radius
  , className :: String
  | r
  )

code
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CodeProps () }
  => { | givenProps }
  -> kids
  -> JSX
code props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString }
  Raw.code props kids
