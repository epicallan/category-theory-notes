module PartOne.ProductsAndCategories.Notes where

{-
 Universal constructions
_________________________

 Universal construction is the defining of objects in terms of their relationships
 with others

 Initial Object
 ---------------

 An initial object is the one that has only one morphism going to any object in the category

 Void corresponding to an empty set is an initial object in the category of types
 because there is only one relationship from it to the rest of the other objects.

    absurd :: Void -> a

Terminal object
--------------

 An object with one and only one morphism coming to it from any object in the category

 In the category of sets, the terminal object is a singleton (a type with only one value)

 unit :: a -> ()
 unit _ = ()

 Bool is not terminal because it can have morphisms that return either True or False for any object

 yes :: a -> Bool
 yes _ = True


 no :: a -> Bool
 no _ = False

Duality
-----------

 For every category construction there is it's opposite.
 For Monads we have co-monad and Products we have co-products

 Hence a terminal object is the initial object in the opposite category

Isomorphisms
-------------

 The intuition is that every part of an object corresponds to some part in another object
 in a one to one mapping.

 
 An isomorphism is an invertible morphism, a pair of morphisms , one being the inverse
 of the other.

 morphism g is the inverse of f if their composition is the identity morphism

 f . g = id
 g . f = id

 Initial, terminal objects are unique up to isomorphism means that any 2 initial (terminal) objects
 are isomorphic.

 2 initial objects i1 and i2:

  - since i1 is initial there is a unique morphism from i1 to 12 f
     f :: i1 -> 12

  - since i2 is initial there is a unique morphism from i2 to i1
      g :: i2 -> i1
  - composition

     g . f = i1 -> 11 but i1 is initial and since we can only have one morphism
     i1 to i1 is identity morphism given i1 is a category

     similarly f. g must be equal to identity.

     This proves f and g must be inverse of each other, therefore any 2 initial
     objects are a category

Products
-------------

 A cartesian product of 2 sets is a set of pairs. There are 2 functions, the projections, from
 the product to each of the constituents. (fst and snd)

   Projections from c to its constituents
     p :: c -> a
     q :: c -> b

  any object that fits c can be a product candidate
-}

p_ :: Int -> Int
p_ x = x

q_ :: Int -> Bool
q_ _ = True

p1 :: (Int, Int, Bool) -> Int
p1 (x, _, _) = x

q2 :: (Int, Int, Bool) -> Bool
q2 (_, _, b) = b

{-
 we can rank the quality of our product candidates by the following criteria

 For instance for c' and c

 1 - If there is a morphism m from c' to c, c is better.
 2 - If Projections p' and q' from c' to a and b respectively can be reconstructed by
     p and q using m. Then c is better. See diagram in book and code example

-}

type C' = Int
type C = (Int, Bool)
type A = Int
type B = Bool

p' :: C' -> A
p' x = x

q' :: C' -> B
q' _ = True

m :: C' -> C
m x = (x, True)

p :: C -> A
p (x, _) = x

q :: C -> B
q (_, b) = b

-- prove that C is better product and its projections are better

p'' :: C' -> A
-- ^ assume p'' is p'
-- p' = p . m
p'' = p . m

q'' :: C' -> B
-- ^ assume q'' is q'
-- q' = q . m
q''  = q . m

-- m factorizes p' and q'. m is a common factor shared by p' and q'

-- | A product of 2 objets a and b is the object c equipped with 2 projections
-- such that for any other object c' equipped with 2 projections, there is a unique
-- morphism m from c' to c that factorizes those projections

-- function producing m

factorizer :: (c -> a) -> (c -> b) -> (c -> (a, b))
factorizer p3 q3 = \ x -> (p3 x , q3 x)

{-
 Coproduct
 ---------------

 Coproduct is the dual to product.

 When we reverse the arrows in the product pattern, we end up with an object c equipped
 with 2 injections. i and j.

 i :: a -> c
 j :: b -> c

 ranking
 ----------

 - c is better than c' if there is m from c to c'

  i' = m . i
  j' = m  . j

-}

-- | A Coproduct of 2 objects a and b is the object c equipped with 2 injections such that
-- for any other object c' equipped with 2 injections there is a unique morphism m from
-- c to c' that factorizes those injections.

{-
 In the category of sets, the coproduct is the disjoint union of 2 sets.
 An element of the disjoint union of A or B is either an element of a or an element of B.
 If the 2 sets overlap the disjoint union contains 2 copies of the common part.
-}

-- Example

data Contact = PhoneNum Int | EmailAddr String

-- PhoneNum and EmailAddr are coproduct injections

-- The canonical implementation of the product is the primitive tuple pair
-- while for coproduct it is the Either type.

-- | Factorizer for co-product
-- Given a candidate type c and 2 candidate injections i and j, the factorizer
-- for either is as below.

factorizer2 :: (a -> c) -> (b -> c) -> Either a b -> c
factorizer2 i _j (Left a)  = i a
factorizer2 _i j (Right b) = j b

{-
 Asymmetry
 --------

 Products behave like multiplication with the terminal object playing the role of 1
 while co-products behave more like the sum, with the initial object playing the role of
 zero.

 We can think of a function from a singleton set as a embedding its single element in the codomain
 and the opposite functions are named surjective.

 Non-collapsing functions are known as injective or one to one
 Functions that are neither embedding or collapsing are called bijections. Isomporphic functions
 are bijections.

-}
