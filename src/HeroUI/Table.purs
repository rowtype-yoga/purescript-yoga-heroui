module HeroUI.Table where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Align, Color, Radius, SelectionBehavior, SelectionMode, ShadowSize, alignToString, colorToString, radiusToString, selectionBehaviorToString, selectionModeToString, shadowToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data Layout = LayoutAuto | LayoutFixed

derive instance Eq Layout
derive instance Ord Layout

layoutToString :: Layout -> String
layoutToString = case _ of
  LayoutAuto -> "auto"
  LayoutFixed -> "fixed"

data ContentPlacement = ContentInside | ContentOutside

derive instance Eq ContentPlacement
derive instance Ord ContentPlacement

contentPlacementToString :: ContentPlacement -> String
contentPlacementToString = case _ of
  ContentInside -> "inside"
  ContentOutside -> "outside"

data DisabledBehavior = DisabledSelection | DisabledAll

derive instance Eq DisabledBehavior
derive instance Ord DisabledBehavior

disabledBehaviorToString :: DisabledBehavior -> String
disabledBehaviorToString = case _ of
  DisabledSelection -> "selection"
  DisabledAll -> "all"



type TableProps r =
  ( color :: Color
  , layout :: Layout
  , radius :: Radius
  , shadow :: ShadowSize
  , maxTableHeight :: Int
  , rowHeight :: Int
  , isVirtualized :: Boolean
  , hideHeader :: Boolean
  , isStriped :: Boolean
  , isCompact :: Boolean
  , isHeaderSticky :: Boolean
  , fullWidth :: Boolean
  , removeWrapper :: Boolean
  , baseComponent :: Foreign
  , topContent :: JSX
  , bottomContent :: JSX
  , topContentPlacement :: ContentPlacement
  , bottomContentPlacement :: ContentPlacement
  , showSelectionCheckboxes :: Boolean
  , sortDescriptor :: Foreign
  , selectedKeys :: Array String
  , defaultSelectedKeys :: Array String
  , disabledKeys :: Array String
  , disallowEmptySelection :: Boolean
  , selectionMode :: SelectionMode
  , selectionBehavior :: SelectionBehavior
  , disabledBehavior :: DisabledBehavior
  , allowDuplicateSelectionEvents :: Boolean
  , disableAnimation :: Boolean
  , checkboxesProps :: Foreign
  , classNames :: Foreign
  , className :: String
  , isKeyboardNavigationDisabled :: Boolean
  , onRowAction :: EffectFn1 Foreign Unit
  , onCellAction :: EffectFn1 Foreign Unit
  , onSelectionChange :: EffectFn1 Foreign Unit
  , onSortChange :: EffectFn1 Foreign Unit
  | r
  )

table
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableProps () }
  => { | givenProps }
  -> kids
  -> JSX
table props kids = runFn4 createElementTransformImpl
  { color: colorToString, layout: layoutToString, radius: radiusToString, shadow: shadowToString, topContentPlacement: contentPlacementToString, bottomContentPlacement: contentPlacementToString, selectionMode: selectionModeToString, selectionBehavior: selectionBehaviorToString, disabledBehavior: disabledBehaviorToString }
  Raw.table props kids

type TableHeaderProps r =
  ( columns :: Foreign
  , className :: String
  | r
  )

tableHeader
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableHeaderProps () }
  => { | givenProps }
  -> kids
  -> JSX
tableHeader = runFn3 createElementImpl Raw.tableHeader

type TableColumnProps r =
  ( key :: String
  , align :: Align
  , hideHeader :: Boolean
  , allowsSorting :: Boolean
  , sortIcon :: JSX
  , isRowHeader :: Boolean
  , textValue :: String
  , width :: Foreign
  , minWidth :: Foreign
  , maxWidth :: Foreign
  , className :: String
  | r
  )

tableColumn
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableColumnProps () }
  => { | givenProps }
  -> kids
  -> JSX
tableColumn props kids = runFn4 createElementTransformImpl
  { align: alignToString }
  Raw.tableColumn props kids

type TableBodyProps r =
  ( items :: Foreign
  , isLoading :: Boolean
  , loadingState :: String
  , loadingContent :: JSX
  , emptyContent :: JSX
  , className :: String
  , onLoadMore :: EffectFn1 Foreign Unit
  | r
  )

tableBody
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableBodyProps () }
  => { | givenProps }
  -> kids
  -> JSX
tableBody = runFn3 createElementImpl Raw.tableBody

type TableRowProps r =
  ( key :: String
  , textValue :: String
  , className :: String
  | r
  )

tableRow
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableRowProps () }
  => { | givenProps }
  -> kids
  -> JSX
tableRow = runFn3 createElementImpl Raw.tableRow

type TableCellProps r =
  ( textValue :: String
  , className :: String
  | r
  )

tableCell
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TableCellProps () }
  => { | givenProps }
  -> kids
  -> JSX
tableCell = runFn3 createElementImpl Raw.tableCell
