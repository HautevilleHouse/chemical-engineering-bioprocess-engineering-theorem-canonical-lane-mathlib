import Mathlib.Algebra.BigOperators.Basic
import Mathlib.Analysis.SpecialFunctions.Integrals

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure AdditiveLane (X : Type) [Add X] [Sub X] where
  state : X
  delta : X
  projection : X → X
  xNext : X
  carriedComponent : X
  x_next_eq : xNext = state + projection delta
  carried_component_eq : carriedComponent = delta - projection delta
  projection_idempotent_on_delta : projection (projection delta) = projection delta

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
