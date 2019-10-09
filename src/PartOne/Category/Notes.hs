module PartOne.Category.Notes where

{-
 A Category consists of a objects and arrows that go between them.
 An arrow from object A to Object B and another from B to C then there must be
 an arrow from A to C, their composition.
-}

{-
 Arrows as Functions
 --------------------

 - Arrows are called morphisms and they are functions.
 - Functions can be composed resulting into new functions

 Properties of composition
 -------------------------

 - Composition is associative
   h ∘ (𝑔∘𝑓) = (h∘𝑔) ∘ 𝑓 = h ∘𝑔 ∘ 𝑓

 - For every object A there is an arrow which is a unit of composition
   This arrow loops from the object to itself.
   The unit arrow for object A is called id(a). If f goes from A to B then

   f . id(a) = f

   id(b) . f = f
-}
