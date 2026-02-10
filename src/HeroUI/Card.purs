module HeroUI.Card where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Radius, ShadowSize, radiusToString, shadowToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type CardProps r =
  ( shadow :: ShadowSize
  , radius :: Radius
  , fullWidth :: Boolean
  , isHoverable :: Boolean
  , isPressable :: Boolean
  , isBlurred :: Boolean
  , isFooterBlurred :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , disableRipple :: Boolean
  , allowTextSelectionOnPress :: Boolean
  , classNames :: Foreign
  , className :: String
  , onPress :: EventHandler
  , onPressStart :: EventHandler
  , onPressEnd :: EventHandler
  , onPressChange :: EffectFn1 Boolean Unit
  , onPressUp :: EventHandler
  | r
  )

card
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CardProps () }
  => { | givenProps }
  -> kids
  -> JSX
card props kids = runFn4 createElementTransformImpl
  { shadow: shadowToString, radius: radiusToString }
  Raw.card props kids

type CardHeaderProps r =
  ( className :: String
  | r
  )

cardHeader
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CardHeaderProps () }
  => { | givenProps }
  -> kids
  -> JSX
cardHeader = runFn3 createElementImpl Raw.cardHeader

type CardBodyProps r =
  ( className :: String
  | r
  )

cardBody
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CardBodyProps () }
  => { | givenProps }
  -> kids
  -> JSX
cardBody = runFn3 createElementImpl Raw.cardBody

type CardFooterProps r =
  ( isBlurred :: Boolean
  , className :: String
  | r
  )

cardFooter
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | CardFooterProps () }
  => { | givenProps }
  -> kids
  -> JSX
cardFooter = runFn3 createElementImpl Raw.cardFooter
