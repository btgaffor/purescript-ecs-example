module Model where

import Prelude
import Control.Monad.State (gets, modify_)
import Data.Map (Map)
import Ecs (class GetStore, class SaveStore, Entity, EntityCount, Global, initStore)

data Position
  = Position Int

instance showPosition :: Show Position where
  show (Position num) = "(Position " <> show num <> ")"

data Velocity
  = Velocity Int

instance showVelocity :: Show Velocity where
  show (Velocity num) = "(Velocity " <> show num <> ")"

data World
  = World
    { entityCounter :: Global EntityCount
    , positions :: Map Entity Position
    , velocities :: Map Entity Velocity
    }

unWorld ::
  World ->
  { entityCounter :: Global EntityCount
  , positions :: Map Entity Position
  , velocities :: Map Entity Velocity
  }
unWorld (World world) = world

initWorld :: World
initWorld =
  World
    { entityCounter: initStore
    , positions: initStore
    , velocities: initStore
    }

instance hasEntityCounter :: GetStore World EntityCount (Global EntityCount) where
  getStore _ = gets (unWorld >>> _.entityCounter)

instance saveStoreEntityCounter :: SaveStore World (Global EntityCount) where
  saveStore entityCounter = modify_ (unWorld >>> _ { entityCounter = entityCounter } >>> World)

instance hasPosition :: GetStore World Position (Map Entity Position) where
  getStore _ = gets (unWorld >>> _.positions)

instance saveStorePosition :: SaveStore World (Map Entity Position) where
  saveStore positions = modify_ (unWorld >>> _ { positions = positions } >>> World)

instance hasVelocity :: GetStore World Velocity (Map Entity Velocity) where
  getStore _ = gets (unWorld >>> _.velocities)

instance saveStoreVelocity :: SaveStore World (Map Entity Velocity) where
  saveStore velocities = modify_ (unWorld >>> _ { velocities = velocities } >>> World)
