module HeroUI.Listbox.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Listbox (listbox, listboxItem)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Light | Flat | Faded | Shadow

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
  Light -> T.Light
  Flat -> T.Flat
  Faded -> T.Faded
  Shadow -> T.Shadow

mkListbox :: { color :: Color, variant :: Variant } -> JSX
mkListbox = component "ListboxStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs border rounded-lg p-1" }
        [ listbox
            { color: toColor props.color
            , variant: toVariant props.variant
            , selectionMode: T.Single
            }
            [ listboxItem { key: "new" } (text "New file")
            , listboxItem { key: "copy" } (text "Copy link")
            , listboxItem { key: "edit" } (text "Edit file")
            , listboxItem { key: "delete" } (text "Delete file")
            ]
        ]
    ]

default :: JSX
default = story "default" mkListbox
  { color: enum Default
  , variant: enum Solid
  }
