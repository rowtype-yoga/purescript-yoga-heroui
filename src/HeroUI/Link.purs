module HeroUI.Link where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Size, UnderlineStyle, colorToString, sizeToString, underlineToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type LinkProps r =
  ( size :: Size
  , color :: Color
  , underline :: UnderlineStyle
  , href :: String
  , target :: String
  , rel :: String
  , download :: Foreign
  , ping :: String
  , referrerPolicy :: String
  , isExternal :: Boolean
  , showAnchorIcon :: Boolean
  , anchorIcon :: JSX
  , isBlock :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , className :: String
  , onPress :: EventHandler
  , onPressStart :: EventHandler
  , onPressEnd :: EventHandler
  , onPressChange :: EffectFn1 Boolean Unit
  , onPressUp :: EventHandler
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  , onClick :: EventHandler
  | r
  )

link
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | LinkProps () }
  => { | givenProps }
  -> kids
  -> JSX
link props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, underline: underlineToString }
  Raw.link props kids
