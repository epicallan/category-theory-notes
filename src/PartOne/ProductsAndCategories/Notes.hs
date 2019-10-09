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

 An isomorphism is an invertible morphism, a pair of morphisms , one being the inverse
 of the other.

 morphism g is the inverse of f if their composition is the identity morphism

 f . g = id
 g . f = id

 Any two initial objects are isomorphic.

Products
-------------

 A cartesian product of 2 sets s a set of pairs. There are 2 functions, the projects, from
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

-- prove that C is better product

p'' :: C' -> A
-- ^ assume p'' is p'
-- p' = p . m
p'' = p . m

q'' :: C' -> B
-- ^ assume q'' is q'
-- q' = q . m
q''  = q . m

