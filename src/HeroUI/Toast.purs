module HeroUI.Toast where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign, unsafeToForeign)
import HeroUI.Types (Color, Placement, Radius, Variant, colorToString, placementToString, radiusToString, variantToString)
import HeroUI.Internal (class CoerceHeroProps, createElementTransformImpl)
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
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | ToastProps () }
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
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | ToastProviderProps () }
  => { | givenProps }
  -> kids
  -> JSX
toastProvider props kids = runFn4 createElementTransformImpl
  { placement: placementToString }
  Raw.toastProvider props kids

foreign import addToastImpl :: EffectFn1 Foreign (Nullable String)
foreign import closeToastImpl :: EffectFn1 String Unit
foreign import closeAllToastsImpl :: Effect Unit

-- | Imperatively enqueue a toast. Returns the toast id, or `Nothing` if the
-- | queue rejected it (e.g. when no `ToastProvider` is mounted).
-- | https://heroui.com/docs/components/toast#api
addToast
  :: forall givenProps nonDataProps
   . CoerceHeroProps { | givenProps } { | nonDataProps } { | ToastProps () }
  => { | givenProps }
  -> Effect (Maybe String)
addToast props = map toMaybe (runEffectFn1 addToastImpl (unsafeToForeign props))

closeToast :: String -> Effect Unit
closeToast = runEffectFn1 closeToastImpl

closeAllToasts :: Effect Unit
closeAllToasts = closeAllToastsImpl
