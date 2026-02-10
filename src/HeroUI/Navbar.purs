module HeroUI.Navbar where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data Position = Static | Sticky

derive instance Eq Position
derive instance Ord Position

positionToString :: Position -> String
positionToString = case _ of
  Static -> "static"
  Sticky -> "sticky"

data MaxWidth = MaxSm | MaxMd | MaxLg | MaxXl | Max2xl | MaxFull

derive instance Eq MaxWidth
derive instance Ord MaxWidth

maxWidthToString :: MaxWidth -> String
maxWidthToString = case _ of
  MaxSm -> "sm"
  MaxMd -> "md"
  MaxLg -> "lg"
  MaxXl -> "xl"
  Max2xl -> "2xl"
  MaxFull -> "full"

data NavbarJustify = JustifyStart | JustifyCenter | JustifyEnd

derive instance Eq NavbarJustify
derive instance Ord NavbarJustify

navbarJustifyToString :: NavbarJustify -> String
navbarJustifyToString = case _ of
  JustifyStart -> "start"
  JustifyCenter -> "center"
  JustifyEnd -> "end"

type NavbarProps r =
  ( height :: Foreign
  , position :: Position
  , maxWidth :: MaxWidth
  , parentRef :: Foreign
  , isBordered :: Boolean
  , isBlurred :: Boolean
  , isMenuOpen :: Boolean
  , isMenuDefaultOpen :: Boolean
  , shouldHideOnScroll :: Boolean
  , motionProps :: Foreign
  , disableScrollHandler :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onMenuOpenChange :: EffectFn1 Boolean Unit
  , onScrollPositionChange :: EffectFn1 Foreign Unit
  | r
  )

navbar
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbar props kids = runFn4 createElementTransformImpl
  { position: positionToString, maxWidth: maxWidthToString }
  Raw.navbar props kids

type NavbarBrandProps r =
  ( className :: String | r )

navbarBrand
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarBrandProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarBrand = runFn3 createElementImpl Raw.navbarBrand

type NavbarContentProps r =
  ( justify :: NavbarJustify
  , className :: String
  | r
  )

navbarContent
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarContentProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarContent props kids = runFn4 createElementTransformImpl
  { justify: navbarJustifyToString }
  Raw.navbarContent props kids

type NavbarItemProps r =
  ( isActive :: Boolean
  , className :: String
  | r
  )

navbarItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarItem = runFn3 createElementImpl Raw.navbarItem

type NavbarMenuToggleProps r =
  ( icon :: Foreign
  , isSelected :: Boolean
  , defaultSelected :: Boolean
  , srOnlyText :: String
  , className :: String
  , onChange :: EffectFn1 Foreign Unit
  | r
  )

navbarMenuToggle
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarMenuToggleProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarMenuToggle = runFn3 createElementImpl Raw.navbarMenuToggle

type NavbarMenuProps r =
  ( portalContainer :: Foreign
  , motionProps :: Foreign
  , className :: String
  | r
  )

navbarMenu
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarMenuProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarMenu = runFn3 createElementImpl Raw.navbarMenu

type NavbarMenuItemProps r =
  ( isActive :: Boolean
  , className :: String
  | r
  )

navbarMenuItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | NavbarMenuItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
navbarMenuItem = runFn3 createElementImpl Raw.navbarMenuItem
