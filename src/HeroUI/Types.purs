module HeroUI.Types where

import Prelude

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Eq Color
derive instance Ord Color

colorToString :: Color -> String
colorToString = case _ of
  Default -> "default"
  Primary -> "primary"
  Secondary -> "secondary"
  Success -> "success"
  Warning -> "warning"
  Danger -> "danger"

data Size = Sm | Md | Lg

derive instance Eq Size
derive instance Ord Size

sizeToString :: Size -> String
sizeToString = case _ of
  Sm -> "sm"
  Md -> "md"
  Lg -> "lg"

data Radius = RadiusNone | RadiusSm | RadiusMd | RadiusLg | RadiusFull

derive instance Eq Radius
derive instance Ord Radius

radiusToString :: Radius -> String
radiusToString = case _ of
  RadiusNone -> "none"
  RadiusSm -> "sm"
  RadiusMd -> "md"
  RadiusLg -> "lg"
  RadiusFull -> "full"

data Variant
  = Solid
  | Bordered
  | Light
  | Flat
  | Faded
  | Shadow
  | Ghost
  | Dot
  | Underlined
  | Splitted

derive instance Eq Variant
derive instance Ord Variant

variantToString :: Variant -> String
variantToString = case _ of
  Solid -> "solid"
  Bordered -> "bordered"
  Light -> "light"
  Flat -> "flat"
  Faded -> "faded"
  Shadow -> "shadow"
  Ghost -> "ghost"
  Dot -> "dot"
  Underlined -> "underlined"
  Splitted -> "splitted"

data ShadowSize = ShadowNone | ShadowSm | ShadowMd | ShadowLg

derive instance Eq ShadowSize
derive instance Ord ShadowSize

shadowToString :: ShadowSize -> String
shadowToString = case _ of
  ShadowNone -> "none"
  ShadowSm -> "sm"
  ShadowMd -> "md"
  ShadowLg -> "lg"

data LabelPlacement = Inside | Outside | OutsideLeft | OutsideTop

derive instance Eq LabelPlacement
derive instance Ord LabelPlacement

labelPlacementToString :: LabelPlacement -> String
labelPlacementToString = case _ of
  Inside -> "inside"
  Outside -> "outside"
  OutsideLeft -> "outside-left"
  OutsideTop -> "outside-top"

data Orientation = Horizontal | Vertical

derive instance Eq Orientation
derive instance Ord Orientation

orientationToString :: Orientation -> String
orientationToString = case _ of
  Horizontal -> "horizontal"
  Vertical -> "vertical"

data SelectionMode = SelectionNone | Single | Multiple

derive instance Eq SelectionMode
derive instance Ord SelectionMode

selectionModeToString :: SelectionMode -> String
selectionModeToString = case _ of
  SelectionNone -> "none"
  Single -> "single"
  Multiple -> "multiple"

data SelectionBehavior = Toggle | Replace

derive instance Eq SelectionBehavior
derive instance Ord SelectionBehavior

selectionBehaviorToString :: SelectionBehavior -> String
selectionBehaviorToString = case _ of
  Toggle -> "toggle"
  Replace -> "replace"

data ValidationBehavior = Native | Aria

derive instance Eq ValidationBehavior
derive instance Ord ValidationBehavior

validationBehaviorToString :: ValidationBehavior -> String
validationBehaviorToString = case _ of
  Native -> "native"
  Aria -> "aria"

data Placement
  = PlacementAuto
  | PlacementTop
  | PlacementBottom
  | PlacementCenter
  | PlacementTopCenter
  | PlacementBottomCenter
  | PlacementLeft
  | PlacementRight
  | PlacementStart
  | PlacementEnd
  | PlacementTopRight
  | PlacementTopLeft
  | PlacementBottomRight
  | PlacementBottomLeft

derive instance Eq Placement
derive instance Ord Placement

placementToString :: Placement -> String
placementToString = case _ of
  PlacementAuto -> "auto"
  PlacementTop -> "top"
  PlacementBottom -> "bottom"
  PlacementCenter -> "center"
  PlacementTopCenter -> "top-center"
  PlacementBottomCenter -> "bottom-center"
  PlacementLeft -> "left"
  PlacementRight -> "right"
  PlacementStart -> "start"
  PlacementEnd -> "end"
  PlacementTopRight -> "top-right"
  PlacementTopLeft -> "top-left"
  PlacementBottomRight -> "bottom-right"
  PlacementBottomLeft -> "bottom-left"

data Backdrop = Transparent | Opaque | Blur

derive instance Eq Backdrop
derive instance Ord Backdrop

backdropToString :: Backdrop -> String
backdropToString = case _ of
  Transparent -> "transparent"
  Opaque -> "opaque"
  Blur -> "blur"

data ScrollBehavior = ScrollNormal | ScrollInside | ScrollOutside

derive instance Eq ScrollBehavior
derive instance Ord ScrollBehavior

scrollBehaviorToString :: ScrollBehavior -> String
scrollBehaviorToString = case _ of
  ScrollNormal -> "normal"
  ScrollInside -> "inside"
  ScrollOutside -> "outside"

data UnderlineStyle = UnderlineNone | UnderlineActive | UnderlineHover | UnderlineFocus | UnderlineAlways

derive instance Eq UnderlineStyle
derive instance Ord UnderlineStyle

underlineToString :: UnderlineStyle -> String
underlineToString = case _ of
  UnderlineNone -> "none"
  UnderlineActive -> "active"
  UnderlineHover -> "hover"
  UnderlineFocus -> "focus"
  UnderlineAlways -> "always"

data Align = AlignStart | AlignCenter | AlignEnd

derive instance Eq Align
derive instance Ord Align

alignToString :: Align -> String
alignToString = case _ of
  AlignStart -> "start"
  AlignCenter -> "center"
  AlignEnd -> "end"
