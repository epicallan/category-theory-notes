module PartOne.CategoriesGreatAndSmall.Notes where

{-
 No Object category
 _________________

 This is category with no objects and no morphisms in the category of all categories

 Simple Graphs
 -------------
  A graph can have nodes which we can think of as objects in a category, with every
  composable chain of graph edges as morphisms.
  Such a category is known as a Free Category generated by a given Graph.

  >> A free structure is one that is created by extending a given structure with minimal items
  to satisfy its laws.

Orders
________
 A category where every a morphism is a relation between objects. The relation of being less or equal

 Order sets
 ---------
 - Pre-order or thin set
 - partial order (if a <= b and b <= a, then a must be the same as b)
 - Total or linear order (any two objects in the set are always in a relation with each other)
-}

{-
Hom-set
---------
 A set of morphisms from object a to object b in a category C is called a hom-set
 written as C(a, b) or HOMc(a,b)

 Elements in a Hom-set can be seen as morphisms which follow rules of composition and as points
 in a set.

 Every hom-set in a pre-order is either empty or singleton
-}

{-
Monoid as Set
________________

 Monoid is a set with a binary operation. The operation is associative and
 there is one element that behave like a unit with respect to it.

 Natural number with a zero form a monoid under addition

   (a + b) + c = a + (b + c) -- associative

  addition is commutative i.e (a + b) = (b + a) but commutativity is not part of the
  definition of a monoid

 Values of function arguments are sometimes called points. For strings 'mappend' (Monoid class) and (++)
 have point-wise equality or extensional equality.


-}

-- | It seems when we talk of Sets we are looking at operations between elements with in a category
-- and when we talk of Category we are looking at composition between operations or elements

{-
Monoid as Category
------------------

 A monoid is a single object category with a set of morphisms that follow appropriate rules of composition

 We have a hom-set M(m, m) with single object m in the Category M. We can define a binary operator in the set.
 The monoidal product of 2 set elements in the set corresponds to the composition of the corresponding morphisms.

 2 elements f and g in M(m, m) have their products corresponding to f . g

 (+ 2) and (+ 5) and (+ 2) . (+ 5) form a hom-set in the Monoid Category (M) of natural numbers (n) i.e M(n, n)

 Composition of morphisms in M translate into monoidal products in the set M(n, n)

-}

{-
 Solutions to exercises
 ----------------------

 Considering that Bool is a set of two values True and False, show that it forms two (set-theoretical) monoids with respect to, respectively, operator && (AND) and || (OR).

  a && (b && c) = (a && b) && c
  a || (b || c) = (a || b) || c

  a && true = a
  true && a = a

  a || false = a
  false || a = a

  Represent the Bool monoid with the AND operator as a category: List the morphisms and their rules of composition.

 id = (AND True)
 id . (AND False) = (AND False)
 (AND False) . (AND False) = (AND False)
 (AND False) . id = (AND False)
 id . id = id

-}

return :: Bool -> Bool
return = (&& True)

composition :: (Bool -> Bool) -> (Bool -> Bool) -> (Bool -> Bool)
composition f g x = g $ f x