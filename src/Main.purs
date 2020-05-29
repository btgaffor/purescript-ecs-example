module Main where

import Prelude

import Control.Monad.State (evalStateT)
import Effect (Effect)
import Example1 (example1)
import Model (initWorld)

main :: Effect Unit
main = do
  evalStateT example1 initWorld
