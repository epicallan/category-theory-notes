module PartOne.Functors.Notes where

{-
 A functor is a mapping between categories

 Given 2 categories C and D a functor F maps objects C to D

 If a is an object in C, then in D its F a

 A functor also maps morphisms, its a function on morphisms

 if f in C connects a to b
   f :: a -> b
 then
   F f :: F a -> F b

 connects image of a to image of b

 for composition h = g . f , we want to have Fh = Fg . Ff

 Identity morphisms in C should be mapped to identity morphisms in D

 F (id a) = id (fa)

 Functors must preserve the structure of a category.

 Functors may do embedding and collapsing.
 The maximally collapsing functor is the constant functor.


 Functors in programming
 ----------------------

 Functors that map this category into itself are endofunctors

 An endofunctor in the category of types hence maps types to types.
 An example of this, is types parameterized by other types.

 The Maybe Functor
 --------------------

 data Maybe a = Nothing | Just a

 Functor is a mapping of objects in the sense that we can map a to (Maybe a)
 its also a mapping of morphisms in the sense we can map (f :: a -> b) to (Maybe a -> Maybe b)

-}

f :: a -> b
f = undefined

f' :: Maybe a -> Maybe b
f' x  = case x of
  Nothing -> Nothing
  Just y  -> Just ( f y)

{-
 Morphism mapping in functors can be implemented using fmap as a high order function
 in the case of Maybe

 fmap :: (a -> b) -> (Maybe a -> Maybe b)

 fmap lifts a function to work on Functor values of Maybe for case above

 Equational reasoning to prove functor laws
 ------------------------------------------


-}