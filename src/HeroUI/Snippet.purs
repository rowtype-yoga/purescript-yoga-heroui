module HeroUI.Snippet where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Radius, Size, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type SnippetProps r =
  ( size :: Size
  , radius :: Radius
  , symbol :: JSX
  , timeout :: Int
  , codeString :: String
  , tooltipProps :: Foreign
  , copyIcon :: JSX
  , checkIcon :: JSX
  , disableTooltip :: Boolean
  , disableCopy :: Boolean
  , hideCopyButton :: Boolean
  , hideSymbol :: Boolean
  , copyButtonProps :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onCopy :: EffectFn1 Foreign Unit
  | r
  )

snippet
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SnippetProps () }
  => { | givenProps }
  -> kids
  -> JSX
snippet props kids = runFn4 createElementTransformImpl
  { size: sizeToString, radius: radiusToString }
  Raw.snippet props kids
