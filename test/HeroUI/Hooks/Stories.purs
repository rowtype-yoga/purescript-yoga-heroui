module HeroUI.Hooks.Stories (default) where

import Prelude hiding (div)

import Foreign (Foreign, unsafeToForeign)
import React.Basic (JSX)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import HeroUI.Button as Btn
import HeroUI.Hooks as Hooks
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkHooks :: {} -> JSX
mkHooks = component "HooksStory" \_ -> React.do
  disclosure <- Hooks.useDisclosure {}
  _ <- Hooks.useModal emptyProps
  _ <- Hooks.useDraggable emptyProps
  _ <- Hooks.useDrawer emptyProps
  _ <- Hooks.usePopover emptyProps
  _ <- Hooks.useDropdown emptyProps
  _ <- Hooks.useSelect emptyProps
  _ <- Hooks.useAutocomplete emptyProps
  _ <- Hooks.useTabs emptyProps
  _ <- Hooks.useAccordion emptyProps
  _ <- Hooks.useAccordionItem emptyProps
  _ <- Hooks.useCheckbox emptyProps
  _ <- Hooks.useCheckboxGroup emptyProps
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-col items-start gap-4" }
        [ div { className: "text-sm text-default-500" } (text "All HeroUI hook bindings mounted")
        , div { className: "flex flex-wrap gap-2" }
            [ Btn.button { color: T.Primary, onPress: handler_ disclosure.onOpen } (text "Open disclosure")
            , Btn.button { variant: T.Bordered, onPress: handler_ disclosure.onClose } (text "Close disclosure")
            , Btn.button { variant: T.Flat, onPress: handler_ disclosure.onOpenChange } (text "Toggle disclosure")
            ]
        , div { className: "text-sm" } (text (if disclosure.isOpen then "Disclosure open" else "Disclosure closed"))
        ]
    ]

emptyProps :: Foreign
emptyProps = unsafeToForeign {}

default :: JSX
default = story "default" mkHooks {}
