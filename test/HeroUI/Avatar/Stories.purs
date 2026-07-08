module HeroUI.Avatar.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Avatar (avatar, avatarGroup)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

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

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkAvatar :: { name :: String, color :: Color, size :: Size, isBordered :: Boolean } -> JSX
mkAvatar = component "AvatarStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-6" }
        [ avatar
            { name: props.name
            , color: toColor props.color
            , size: toSize props.size
            , isBordered: props.isBordered
            }
            (text "")
        , avatarGroup
            { color: toColor props.color
            , size: toSize props.size
            , isBordered: props.isBordered
            , max: 3
            }
            [ avatar { name: "Ada Lovelace" } (text "")
            , avatar { name: "Grace Hopper" } (text "")
            , avatar { name: "Katherine Johnson" } (text "")
            , avatar { name: "Mary Jackson" } (text "")
            ]
        ]
    ]

default :: JSX
default = story "default" mkAvatar
  { name: "Jane Doe"
  , color: enum Primary
  , size: enum Large
  , isBordered: true
  }
