module HeroUI.Toast.Stories (default, bindings) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Foreign (Foreign)
import React.Basic (JSX)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import HeroUI.Button as Btn
import HeroUI.Provider (provider)
import HeroUI.Toast as Toast
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

type StandaloneToastRuntime =
  { toast :: Foreign
  , state :: Foreign
  , heights :: Array Number
  , setHeights :: Foreign
  }

foreign import standaloneToastRuntime :: String -> String -> StandaloneToastRuntime

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Flat

derive instance Generic Variant _

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Solid -> T.Solid
  Bordered -> T.Bordered
  Flat -> T.Flat

mkToast :: { title :: String, description :: String, color :: Color, variant :: Variant } -> JSX
mkToast = component "ToastStory" \props -> React.do
  latestToastId /\ setLatestToastId <- React.useState' (Nothing :: Maybe String)
  let runtime = standaloneToastRuntime props.title props.description
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-col gap-4 max-w-lg" }
        [ Toast.toastProvider
            { placement: T.PlacementBottomRight
            , maxVisibleToasts: 4
            }
            ([] :: Array JSX)
        , div { className: "flex flex-col gap-2" }
            [ div { className: "text-sm text-default-500" } (text "Toast component binding")
            , Toast.toast
                { title: text props.title
                , description: text props.description
                , color: toColor props.color
                , variant: toVariant props.variant
                , radius: T.RadiusMd
                , severity: toColor props.color
                , placement: T.PlacementBottomRight
                , toast: runtime.toast
                , state: runtime.state
                , index: 0
                , total: 1
                , heights: runtime.heights
                , setHeights: runtime.setHeights
                , isRegionExpanded: false
                , maxVisibleToasts: 4
                , toastOffset: 0
                , timeout: 0
                , disableAnimation: true
                , shouldShowTimeoutProgress: true
                }
                (text "")
            ]
        , div { className: "flex flex-wrap items-center gap-2" }
            [ Btn.button
                { color: T.Primary
                , onPress: handler_ (showToast props setLatestToastId)
                }
                (text "addToast")
            , Btn.button
                { variant: T.Bordered
                , isDisabled: latestToastId == Nothing
                , onPress: handler_ (closeLatest latestToastId setLatestToastId)
                }
                (text "closeToast")
            , Btn.button
                { variant: T.Flat
                , color: T.Danger
                , onPress: handler_ (closeAll setLatestToastId)
                }
                (text "closeAllToasts")
            ]
        , div { className: "text-sm text-default-500" } (statusText latestToastId)
        ]
    ]
  where
  showToast props setLatestToastId = do
    latestToastId <- Toast.addToast
      { title: text props.title
      , description: text props.description
      , color: toColor props.color
      , variant: toVariant props.variant
      , radius: T.RadiusMd
      , severity: toColor props.color
      , timeout: 6000
      , shouldShowTimeoutProgress: true
      }
    setLatestToastId latestToastId

  closeLatest latestToastId setLatestToastId = do
    case latestToastId of
      Just toastId -> do
        Toast.closeToast toastId
        setLatestToastId Nothing
      Nothing -> pure unit

  closeAll setLatestToastId = do
    Toast.closeAllToasts
    setLatestToastId Nothing

  statusText = case _ of
    Just toastId -> text ("Latest toast id: " <> toastId)
    Nothing -> text "No toast id yet"

default :: JSX
default = story "default" mkToast
  { title: "Notification"
  , description: "This is a toast message."
  , color: enum Success
  , variant: enum Solid
  }

bindings :: JSX
bindings = story "bindings" mkToast
  { title: "Saved"
  , description: "The imperative addToast/closeToast/closeAllToasts bindings are wired."
  , color: enum Primary
  , variant: enum Flat
  }
