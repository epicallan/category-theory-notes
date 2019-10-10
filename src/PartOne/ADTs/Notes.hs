module PartOne.ADTs.Notes where

{-
 Product types
 --------------

 Records
----------

 A product type with named fields

 Commutative up to isomorphism
 i.e ((a, b), c) is isomorphic to (a, (b, c))

 The unit type () is the unit of the product i.e 1. and the neutral type for
 a record

 (a, ()) is isomorphic to a

 Witness the isomorphism
 rho :: (a, ()) -> a

 rhoInv :: a -> (a, ())

Sum types
--------
 A coproduct give rise to sum types.

 The canonical representation is the Either type.

 Void is the neutral type that stands of zero

 Either a Void. -- Either is a plus and void is zero
 this is isomorphic to a

 a  + 0 = a


Alegbra of types
---------------

 - Sum type and product types are analogous to addition and multiplication.
  Void corresponds to zero and unit to 1

 illustrations
   - A pair of (Int, Void) is equivalent to 1 * 0 = 0
   there is no value for Void and hence (Int, Void) is unrepresentable

 - Distributive property of addition and multiplication

  a * (b + c) = a * b + a * c

  in sum and product type this holds up to isomorphism
  (a, Either b c) = Either (a, b) (a, c)
-}

prodToSum :: (a, Either b c) -> Either (a, b) (a, c)
prodToSum (x, e) = case e of
  Left y  -> Left (x, y)
  Right z -> Right (x, z)

sumToProd :: Either (a, b) (a, c) -> (a, Either b c)
sumToProd e = case e of
  Left (x, y) -> (x, Left y)
  Right (x, z) -> (x, Right z)

{-
 Sums and product types form a semiring (not a full ring since we cant define subtraction)

 Numbers | Types
 ----------------
 0       | Void
 1       | ()
 a + b   | Either a b = Left a | Right b
 a * b   | (a, b) or Pair a b
 2 =
   1 + 1 | data Bool = True | False
 1 + a   | data Maybe = Nothing | Just a


data List a = Nil | Cons a (List a)

if we replace List a with x we get the equation below

x = 1 + (a * x)

substitution of x
  x = 1 + a * x

  x = 1 + a + a * a * x

  x = 1 + a + a ^n

The interpretation is hence: A list is either an empty 1, or a singleton a or a pair (a * a) or a ^n
-}

{-
  Logic and and or also form the below semiring

 Logic | Types
 --------------
 false  | Void
 true   | ()
 a || b | Either a b = Left a | Right b
 a && b | (a, b)
-}

