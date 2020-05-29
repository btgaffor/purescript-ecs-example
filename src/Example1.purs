module Example1 where

import Prelude

import Control.Monad.State (lift)
import Ecs (Entity(..), SystemT, get, set)
import Effect (Effect)
import Effect.Console (logShow)
import Model (Position(..), Velocity(..), World)

example1 :: SystemT World Effect Unit
example1 = do
  set (Entity 0) (Position 50)
  set (Entity 0) (Velocity 5)
  Position p <- get (Entity 0)
  lift $ logShow p
  Velocity v <- get (Entity 0)
  lift $ logShow v
