module HeroUI.Skeleton where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3)
import Foreign (Foreign)
import HeroUI.Raw as Raw

type SkeletonProps r =
  ( isLoaded :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  | r
  )

skeleton
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SkeletonProps () }
  => { | givenProps }
  -> kids
  -> JSX
skeleton = runFn3 createElementImpl Raw.skeleton
