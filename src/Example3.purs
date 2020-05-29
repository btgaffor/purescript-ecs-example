module Example3 where

import Prelude

import Control.Monad.State (lift)
import Data.Tuple.Nested ((/\))
import Ecs (Entity(..), SystemT, cmap, get, set)
import Effect (Effect)
import Effect.Console (log)
import Model (Position(..), Velocity(..), World)

example3 :: SystemT World Effect Unit
example3 = do
  set (Entity 0) (Position 50 /\ Velocity 5)
  cmap $ \(Position p /\ Velocity v) -> (Position (p + v) /\ Velocity (v - 1))
  (Position p /\ Velocity v) <- get (Entity 0)
  lift $ log $ "Position: " <> show p <> ", Velocity: " <> show v
