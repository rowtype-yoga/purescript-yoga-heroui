module HeroUI.Provider where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3)
import HeroUI.Raw as Raw

type ProviderProps r =
  ( locale :: String
  , disableAnimation :: Boolean
  , disableRipple :: Boolean
  , className :: String
  | r
  )

provider
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ProviderProps () }
  => { | givenProps }
  -> kids
  -> JSX
provider = runFn3 createElementImpl Raw.heroUIProvider
