module HeroUI.Toast where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX)
import Data.Function.Uncurried (runFn2, runFn4)
import Foreign (Foreign)
import HeroUI.Types (Color, Placement, Radius, Variant, colorToString, placementToString, radiusToString, variantToString)
import HeroUI.Internal (class CoerceHeroProps, createElementTransformImpl, transformPropsImpl)
import HeroUI.Raw as Raw

type ToastProps r =
  ( title :: JSX
  , icon :: JSX
  , description :: JSX
  , color :: Color
  , variant :: Variant
  , radius :: Radius
  , placement :: Placement
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
  , toast :: Foreign
  , state :: Foreign
  , index :: Int
  , total :: Int
  , heights :: Array Number
  , setHeights :: Foreign
  , isRegionExpanded :: Boolean
  , maxVisibleToasts :: Int
  , toastOffset :: Int
  , disableAnimation :: Boolean
  , isClosing :: Boolean
  | r
  )

toast
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | ToastProps () }
  => { | givenProps }
  -> kids
  -> JSX
toast props kids = runFn4 createElementTransformImpl transforms Raw.toast props kids
  where
  transforms = { color: colorToString, variant: variantToString, radius: radiusToString, placement: placementToString, severity: colorToString }

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
  Raw.toastProvider
  props
  kids

foreign import addToastImpl :: EffectFn1 Foreign (Nullable String)

-- | Imperatively enqueue a toast. Returns the toast id, or `Nothing` if the
-- | queue rejected it (e.g. when no `ToastProvider` is mounted).
-- | https://heroui.com/docs/components/toast#api
addToast
  :: forall givenProps nonDataProps
   . CoerceHeroProps { | givenProps } { | nonDataProps } { | ToastProps () }
  => { | givenProps }
  -> Effect (Maybe String)
addToast props = map toMaybe (runEffectFn1 addToastImpl (runFn2 transformPropsImpl transforms props))
  where
  transforms = { color: colorToString, variant: variantToString, radius: radiusToString, placement: placementToString, severity: colorToString }

foreign import closeToastImpl :: EffectFn1 String Unit

closeToast :: String -> Effect Unit
closeToast = runEffectFn1 closeToastImpl

foreign import closeAllToastsImpl :: Effect Unit

closeAllToasts :: Effect Unit
closeAllToasts = closeAllToastsImpl
