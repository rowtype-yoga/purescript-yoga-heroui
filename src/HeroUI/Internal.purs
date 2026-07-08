module HeroUI.Internal where

import Data.Function.Uncurried (Fn2, Fn4)
import Foreign (Foreign)
import Prim.Boolean (False, True)
import Prim.Row (class Union)
import Prim.RowList (class RowToList, RowList)
import React.Basic (JSX)
import Type.RowList (class ListToRow)
import Type.RowList as RL
import Unsafe.Coerce (unsafeCoerce)
import Yoga.React.DOM.Internal (class DoesStartWith)

foreign import transformPropsImpl
  :: forall transforms props
   . Fn2 transforms props Foreign

foreign import createElementTransformImpl
  :: forall transforms component props children
   . Fn4 transforms component props children JSX

-- | Like `Yoga.React.DOM.Internal.CoerceReactProps`, but additionally
-- | accepts (and silently passes through) `aria-*` attributes. HeroUI's
-- | underlying components forward them to the DOM — see issue #1.
class CoerceHeroProps :: forall k. Type -> k -> Type -> Constraint
class CoerceHeroProps props strippedProps targetProps | props -> strippedProps

instance
  ( WithoutPassthroughProps { | props } { | strippedProps }
  , Union strippedProps missing targetProps
  ) =>
  CoerceHeroProps { | props } { | strippedProps } { | targetProps }

coerceHeroProps
  :: forall props strippedProps targetProps
   . CoerceHeroProps props strippedProps targetProps
  => props
  -> targetProps
coerceHeroProps = unsafeCoerce

class WithoutPassthroughProps props without where
  unsafeHidePassthroughProps :: props -> without

instance
  ( RowToList r rl
  , ListToRow strippedRL stripped
  , WithoutPassthroughRL rl strippedRL
  ) =>
  WithoutPassthroughProps (Record r) (Record stripped) where
  unsafeHidePassthroughProps = unsafeCoerce

class WithoutPassthroughRL (from :: RowList Type) (to :: RowList Type) | from -> to

class
  MaybeWithoutPassthroughRL (exclude :: Boolean) (propName :: Symbol) (propVal :: Type) (from :: RowList Type) (to :: RowList Type)
  | exclude propName propVal from -> to

instance WithoutPassthroughRL RL.Nil RL.Nil
instance
  ( DoesStartWith "data-" propName isData
  , DoesStartWith "aria-" propName isAria
  , BoolOr isData isAria exclude
  , MaybeWithoutPassthroughRL exclude propName propVal from to
  ) =>
  WithoutPassthroughRL (RL.Cons propName propVal from) to

instance (WithoutPassthroughRL from to) => MaybeWithoutPassthroughRL False propName propVal from (RL.Cons propName propVal to)
instance (WithoutPassthroughRL from to) => MaybeWithoutPassthroughRL True propName propVal from to

class BoolOr (a :: Boolean) (b :: Boolean) (c :: Boolean) | a b -> c

instance BoolOr True True True
instance BoolOr True False True
instance BoolOr False True True
instance BoolOr False False False
