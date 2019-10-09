module PartOne.TypesAndFunctions.Notes where

{-
 A Category of Sets is a called a 'Set'

 In Set, objects are sets and morphisms (arrows) are functions
 A set is special because we can peek inside its objects and get intuitions from doing so

 Haskell types are Sets and Haskell functions are mathematical functions
 between sets.

 Mathematical functions always terminate with a value where as Haskell functions may never
 terminate.
 To approximate Haskell functions to mathematical functions we introduce the bottom value (_|_ or ⊥ );
 corresponding to a non terminating computation.

 f :: Bool -> Bool -- may return True or False or _|_

 bottom is represented with 'undefined' in Haskell.

 f :: Bool -> Bool
 f = undefined

 Because of Bottom (_|_) Haskell types and functions are referred to as 'Hask' rather than 'Set'

-}

{-
  Examples of types and functions

 A type corresponding to an empty set, is Void
 ---------------------------------------------

 absurd :: Void -> a

 A type corresponding to a singleton Set is called Unit.
 -------------------------------------------------------

 It can only have one value, that is unit.

 f44 :: () -> Integer
 f44 () = 44

 Every function of unit is equivalent to picking a single element from the target type.

 Functions from unit to any type A are in one to one correspondence with the elements of
 that Set A

  A Bool is a two element Set or type
  ---------------------------------

-}