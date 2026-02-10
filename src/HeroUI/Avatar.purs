module HeroUI.Avatar where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, colorToString, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type AvatarProps r =
  ( src :: String
  , color :: Color
  , radius :: Radius
  , size :: Size
  , name :: String
  , icon :: JSX
  , fallback :: JSX
  , alt :: String
  , isBordered :: Boolean
  , isDisabled :: Boolean
  , isFocusable :: Boolean
  , showFallback :: Boolean
  , imgProps :: Foreign
  , classNames :: Foreign
  , className :: String
  | r
  )

avatar
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AvatarProps () }
  => { | givenProps }
  -> kids
  -> JSX
avatar props kids = runFn4 createElementTransformImpl
  { color: colorToString, radius: radiusToString, size: sizeToString }
  Raw.avatar props kids

type AvatarGroupProps r =
  ( max :: Int
  , total :: Int
  , size :: Size
  , color :: Color
  , radius :: Radius
  , isGrid :: Boolean
  , isDisabled :: Boolean
  , isBordered :: Boolean
  , renderCount :: Foreign
  , classNames :: Foreign
  , className :: String
  | r
  )

avatarGroup
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AvatarGroupProps () }
  => { | givenProps }
  -> kids
  -> JSX
avatarGroup props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString }
  Raw.avatarGroup props kids
