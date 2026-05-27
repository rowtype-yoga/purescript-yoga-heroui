module HeroUI.Autocomplete.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Autocomplete (autocomplete, autocompleteItem)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Flat | Bordered | Underlined | Faded

derive instance Generic Variant _

data Size = Small | Medium | Large

derive instance Generic Size _

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
  Flat -> T.Flat
  Bordered -> T.Bordered
  Underlined -> T.Underlined
  Faded -> T.Faded

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkAutocomplete :: { color :: Color, variant :: Variant, size :: Size } -> JSX
mkAutocomplete = component "AutocompleteStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ autocomplete
            { label: text "Select a fruit"
            , placeholder: "Search..."
            , color: toColor props.color
            , variant: toVariant props.variant
            , size: toSize props.size
            }
            [ autocompleteItem { key: "apple" } (text "Apple")
            , autocompleteItem { key: "banana" } (text "Banana")
            , autocompleteItem { key: "cherry" } (text "Cherry")
            , autocompleteItem { key: "mango" } (text "Mango")
            , autocompleteItem { key: "orange" } (text "Orange")
            ]
        ]
    ]

default :: JSX
default = story "default" mkAutocomplete
  { color: enum Default
  , variant: enum Flat
  , size: enum Medium
  }
