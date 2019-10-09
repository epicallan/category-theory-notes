{-# LANGUAGE TupleSections #-}
module PartOne.KleisliCategories.Notes where

import Data.Char

{-------------------------------
 Writer as a Category
---------------------------------}

type Writer a = (a, String)

-- | identity morphism
return :: a -> Writer a
return = (, "")

-- | composition morphism

(>=>) :: (a -> Writer b) -> (b -> Writer c) -> ( a -> Writer c)
(>=>) f g a =
   let (b, s1) = f a
       (c, s2) = g b
   in (c, s1 <> s2 )

upperCase :: String -> Writer String
upperCase s = (map toUpper s, "upCase ")

toWords :: String -> Writer [String]
toWords s = (words s, "toWords ")

-- composition of two functions
process :: String -> Writer [String]
process = upperCase >=> toWords


{-

Kleisli Category Properties
-----------------------

 - Objects are underlying language types such as Int, String

 - Morphisms from type A to type B are function that go from A to a type derived from B
   using a particular embellishment e.g some Monad such as Writer.

 - Each Kleisli category defines its own way of defining the composition of morphisms

-}

{-------------------------------
            Challenge
-------------------------------}

-- Construct the Kleisli category for partial functions (define composition and identity)

data Optional a = Value a | Nil

returnOptional :: a -> Optional a -- identity
returnOptional = Value

compOptional
  :: (a -> Optional b)
  -> (b -> Optional c)
  -> (a -> Optional c)
compOptional f g x = case f x of
  Value b -> g b
  Nil     -> Nil
