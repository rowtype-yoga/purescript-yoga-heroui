module HeroUI.Button where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import HeroUI.Types (Color, Variant, Size, Radius, colorToString, variantToString, sizeToString, radiusToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data SpinnerPlacement = SpinnerStart | SpinnerEnd

derive instance Eq SpinnerPlacement
derive instance Ord SpinnerPlacement

spinnerPlacementToString :: SpinnerPlacement -> String
spinnerPlacementToString = case _ of
  SpinnerStart -> "start"
  SpinnerEnd -> "end"

type ButtonProps r =
  ( color :: Color
  , variant :: Variant
  , size :: Size
  , radius :: Radius
  , startContent :: JSX
  , endContent :: JSX
  , spinner :: JSX
  , spinnerPlacement :: SpinnerPlacement
  , fullWidth :: Boolean
  , isIconOnly :: Boolean
  , isDisabled :: Boolean
  , isLoading :: Boolean
  , disableRipple :: Boolean
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

buttonTransforms
  :: { color :: Color -> String
     , variant :: Variant -> String
     , size :: Size -> String
     , radius :: Radius -> String
     , spinnerPlacement :: SpinnerPlacement -> String
     }
buttonTransforms =
  { color: colorToString
  , variant: variantToString
  , size: sizeToString
  , radius: radiusToString
  , spinnerPlacement: spinnerPlacementToString
  }

button
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ButtonProps () }
  => { | givenProps }
  -> kids
  -> JSX
button props kids = runFn4 createElementTransformImpl buttonTransforms Raw.button props kids

type ButtonGroupProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , fullWidth :: Boolean
  , isDisabled :: Boolean
  , className :: String
  | r
  )

buttonGroupTransforms
  :: { color :: Color -> String
     , variant :: Variant -> String
     , size :: Size -> String
     , radius :: Radius -> String
     }
buttonGroupTransforms =
  { color: colorToString
  , variant: variantToString
  , size: sizeToString
  , radius: radiusToString
  }

buttonGroup
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ButtonGroupProps () }
  => { | givenProps }
  -> kids
  -> JSX
buttonGroup props kids = runFn4 createElementTransformImpl buttonGroupTransforms Raw.buttonGroup props kids
