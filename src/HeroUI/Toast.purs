module HeroUI.Toast where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Placement, Radius, Variant, colorToString, placementToString, radiusToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type ToastProps r =
  ( title :: JSX
  , icon :: JSX
  , description :: JSX
  , color :: Color
  , variant :: Variant
  , radius :: Radius
  , endContent :: JSX
  , closeIcon :: JSX
  , timeout :: Int
  , promise :: Foreign
  , loadingComponent :: JSX
  , hideIcon :: Boolean
  , hideCloseButton :: Boolean
  , shouldShowTimeoutProgress :: Boolean
  , severity :: Color
  , classNames :: Foreign
  , className :: String
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

toast
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ToastProps () }
  => { | givenProps }
  -> kids
  -> JSX
toast props kids = runFn4 createElementTransformImpl
  { color: colorToString, variant: variantToString, radius: radiusToString, severity: colorToString }
  Raw.toast props kids

type ToastProviderProps r =
  ( maxVisibleToasts :: Int
  , placement :: Placement
  , disableAnimation :: Boolean
  , toastOffset :: Int
  , toastProps :: Foreign
  , regionProps :: Foreign
  , className :: String
  | r
  )

toastProvider
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ToastProviderProps () }
  => { | givenProps }
  -> kids
  -> JSX
toastProvider props kids = runFn4 createElementTransformImpl
  { placement: placementToString }
  Raw.toastProvider props kids
