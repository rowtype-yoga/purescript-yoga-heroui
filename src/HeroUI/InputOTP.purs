module HeroUI.InputOTP where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, Variant, colorToString, radiusToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data TextAlign = TextLeft | TextCenter | TextRight

derive instance Eq TextAlign
derive instance Ord TextAlign

textAlignToString :: TextAlign -> String
textAlignToString = case _ of
  TextLeft -> "left"
  TextCenter -> "center"
  TextRight -> "right"

type InputOtpProps r =
  ( length :: Int
  , allowedKeys :: String
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , value :: String
  , defaultValue :: String
  , description :: JSX
  , errorMessage :: JSX
  , fullWidth :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , baseRef :: Foreign
  , disableAnimation :: Boolean
  , autoFocus :: Boolean
  , textAlign :: TextAlign
  , classNames :: Foreign
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  , onComplete :: EffectFn1 String Unit
  | r
  )

inputOtp
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | InputOtpProps () }
  => { | givenProps }
  -> kids
  -> JSX
inputOtp props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, textAlign: textAlignToString }
  Raw.inputOtp props kids
