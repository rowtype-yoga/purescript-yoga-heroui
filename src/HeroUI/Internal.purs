module HeroUI.Internal where

import Data.Function.Uncurried (Fn4)
import React.Basic (JSX)

foreign import createElementTransformImpl
  :: forall transforms component props children
   . Fn4 transforms component props children JSX
