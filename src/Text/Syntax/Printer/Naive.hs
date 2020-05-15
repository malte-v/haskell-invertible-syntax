module Text.Syntax.Printer.Naive where

import Control.Category ()
import Control.Isomorphism.Partial (IsoFunctor ((<$>)), unapply)
import Control.Monad ((>=>), (>>=), Monad, fail, liftM2, mplus, return)
import Data.Eq (Eq ((==)))
import Data.Function (($))
import Data.List ((++))
import Data.Maybe (Maybe (Just, Nothing), maybe)
import Text.Syntax.Classes (Alternative ((<|>), empty), ProductFunctor ((<*>)), Syntax (pure, token))
import Prelude (String, const)

-- Printer

newtype Printer alpha = Printer (alpha -> Maybe String)

print :: Printer alpha -> alpha -> Maybe String
print (Printer p) = p

instance IsoFunctor Printer where
  iso <$> Printer p =
    Printer (unapply iso >=> p)

instance ProductFunctor Printer where
  Printer p <*> Printer q =
    Printer (\(x, y) -> liftM2 (++) (p x) (q y))

instance Alternative Printer where
  Printer p <|> Printer q =
    Printer (\s -> mplus (p s) (q s))
  empty = Printer (const Nothing)

instance Syntax Printer where
  pure x =
    Printer
      ( \y ->
          if x == y
            then Just ""
            else Nothing
      )
  token = Printer (\t -> Just [t])
