module Text.Syntax.Classes where

import Control.Isomorphism.Partial (IsoFunctor)
import Data.Char (Char)
import Data.Eq (Eq)
import Prelude ()

infixl 3 <|>

infixr 6 <*>

class ProductFunctor f where
  (<*>) :: f alpha -> f beta -> f (alpha, beta)

class Alternative f where
  (<|>) :: f alpha -> f alpha -> f alpha
  empty :: f alpha

class
  (IsoFunctor delta, ProductFunctor delta, Alternative delta) =>
  Syntax delta where
  pure :: Eq alpha => alpha -> delta alpha
  token :: delta Char
