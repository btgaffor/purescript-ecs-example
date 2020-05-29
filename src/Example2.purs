module Example2 where

import Prelude

import Control.Monad.State (lift)
import Data.Tuple.Nested ((/\))
import Ecs (Entity(..), SystemT, get, set)
import Effect (Effect)
import Effect.Console (log)
import Model (Position(..), Velocity(..), World)

example2 :: SystemT World Effect Unit
example2 = do
  set (Entity 0) (Position 50 /\ Velocity 5)
  (Position p /\ Velocity v) <- get (Entity 0)
  lift $ log $ "Position: " <> show p <> ", Velocity: " <> show v
