module HeroUI.Hooks
  ( UseDisclosure
  , UseDisclosureProps
  , UseDisclosureReturn
  , useDisclosure
  , UseModal
  , useModal
  , UseDraggable
  , useDraggable
  , UseDrawer
  , useDrawer
  , UsePopover
  , usePopover
  , UseDropdown
  , useDropdown
  , UseSelect
  , useSelect
  , UseAutocomplete
  , useAutocomplete
  , UseTabs
  , useTabs
  , UseAccordion
  , useAccordion
  , UseAccordionItem
  , useAccordionItem
  , UseCheckbox
  , useCheckbox
  , UseCheckboxGroup
  , useCheckboxGroup
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Prim.Row as Row
import React.Basic.Hooks (Hook)
import React.Basic.Hooks.Internal (unsafeHook)
import Unsafe.Coerce (unsafeCoerce)

-- | Props accepted by `useDisclosure`. All optional; HeroUI inspects only
-- | the fields you actually pass.
type UseDisclosureProps =
  ( isOpen :: Boolean
  , defaultOpen :: Boolean
  , onClose :: Effect Unit
  , onOpen :: Effect Unit
  , onChange :: EffectFn1 Boolean Unit
  , id :: String
  )

-- | Return shape of `useDisclosure`. `getButtonProps`/`getDisclosureProps`
-- | are passed through as `Foreign` because they take and return ARIA props
-- | records that vary per use site.
type UseDisclosureReturn =
  ( isOpen :: Boolean
  , onOpen :: Effect Unit
  , onClose :: Effect Unit
  , onOpenChange :: Effect Unit
  , isControlled :: Boolean
  , getButtonProps :: Foreign -> Foreign
  , getDisclosureProps :: Foreign -> Foreign
  )

foreign import data UseDisclosure :: Type -> Type
foreign import data UseModal :: Type -> Type
foreign import data UseDraggable :: Type -> Type
foreign import data UseDrawer :: Type -> Type
foreign import data UsePopover :: Type -> Type
foreign import data UseDropdown :: Type -> Type
foreign import data UseSelect :: Type -> Type
foreign import data UseAutocomplete :: Type -> Type
foreign import data UseTabs :: Type -> Type
foreign import data UseAccordion :: Type -> Type
foreign import data UseAccordionItem :: Type -> Type
foreign import data UseCheckbox :: Type -> Type
foreign import data UseCheckboxGroup :: Type -> Type

foreign import useDisclosureImpl :: EffectFn1 (Record UseDisclosureProps) (Record UseDisclosureReturn)
foreign import useModalImpl :: EffectFn1 Foreign Foreign
foreign import useDraggableImpl :: EffectFn1 Foreign Foreign
foreign import useDrawerImpl :: EffectFn1 Foreign Foreign
foreign import usePopoverImpl :: EffectFn1 Foreign Foreign
foreign import useDropdownImpl :: EffectFn1 Foreign Foreign
foreign import useSelectImpl :: EffectFn1 Foreign Foreign
foreign import useAutocompleteImpl :: EffectFn1 Foreign Foreign
foreign import useTabsImpl :: EffectFn1 Foreign Foreign
foreign import useAccordionImpl :: EffectFn1 Foreign Foreign
foreign import useAccordionItemImpl :: EffectFn1 Foreign Foreign
foreign import useCheckboxImpl :: EffectFn1 Foreign Foreign
foreign import useCheckboxGroupImpl :: EffectFn1 Foreign Foreign

-- | https://heroui.com/docs/hooks/use-disclosure
useDisclosure
  :: forall props missing
   . Row.Union props missing UseDisclosureProps
  => Record props
  -> Hook UseDisclosure (Record UseDisclosureReturn)
useDisclosure props = unsafeHook (runEffectFn1 useDisclosureImpl (widen props))
  where
  widen :: Record props -> Record UseDisclosureProps
  widen = unsafeCoerce

-- HeroUI's lower-level hooks (`useModal`, `useDropdown`, ...) return rich
-- objects shaped by internal slot machinery; their fields shift across
-- heroui versions. Surface them as `Foreign` and let consumers narrow.

useModal :: Foreign -> Hook UseModal Foreign
useModal props = unsafeHook (runEffectFn1 useModalImpl props)

useDraggable :: Foreign -> Hook UseDraggable Foreign
useDraggable props = unsafeHook (runEffectFn1 useDraggableImpl props)

useDrawer :: Foreign -> Hook UseDrawer Foreign
useDrawer props = unsafeHook (runEffectFn1 useDrawerImpl props)

usePopover :: Foreign -> Hook UsePopover Foreign
usePopover props = unsafeHook (runEffectFn1 usePopoverImpl props)

useDropdown :: Foreign -> Hook UseDropdown Foreign
useDropdown props = unsafeHook (runEffectFn1 useDropdownImpl props)

useSelect :: Foreign -> Hook UseSelect Foreign
useSelect props = unsafeHook (runEffectFn1 useSelectImpl props)

useAutocomplete :: Foreign -> Hook UseAutocomplete Foreign
useAutocomplete props = unsafeHook (runEffectFn1 useAutocompleteImpl props)

useTabs :: Foreign -> Hook UseTabs Foreign
useTabs props = unsafeHook (runEffectFn1 useTabsImpl props)

useAccordion :: Foreign -> Hook UseAccordion Foreign
useAccordion props = unsafeHook (runEffectFn1 useAccordionImpl props)

useAccordionItem :: Foreign -> Hook UseAccordionItem Foreign
useAccordionItem props = unsafeHook (runEffectFn1 useAccordionItemImpl props)

useCheckbox :: Foreign -> Hook UseCheckbox Foreign
useCheckbox props = unsafeHook (runEffectFn1 useCheckboxImpl props)

useCheckboxGroup :: Foreign -> Hook UseCheckboxGroup Foreign
useCheckboxGroup props = unsafeHook (runEffectFn1 useCheckboxGroupImpl props)
