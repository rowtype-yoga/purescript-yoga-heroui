module HeroUI.User where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElementImpl)
import HeroUI.Internal (class CoerceHeroProps)
import Data.Function.Uncurried (runFn3)
import Foreign (Foreign)
import HeroUI.Raw as Raw

type UserProps r =
  ( name :: String
  , description :: JSX
  , isFocusable :: Boolean
  , avatarProps :: Foreign
  , classNames :: Foreign
  , className :: String
  | r
  )

user
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | UserProps () }
  => { | givenProps }
  -> kids
  -> JSX
user = runFn3 createElementImpl Raw.user
