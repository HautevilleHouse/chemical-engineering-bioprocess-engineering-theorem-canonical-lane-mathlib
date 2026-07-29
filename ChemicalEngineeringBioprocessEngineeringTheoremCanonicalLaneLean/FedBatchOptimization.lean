import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.FermentationProductFormation

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure FedBatchPackage {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} (P : ProductFormationPackage M C) where
  feedingRate : ℝ
  feedingStrategy : ℝ → ℝ
  timeHorizon : ℝ
  objectiveFunction : ℝ
  optimizationConstraint : feedingRate = feedingStrategy timeHorizon
  objectiveFunctionDefined : objectiveFunction = ∫ t in (0, timeHorizon), productFormationRate * biomassConcentration - feedingRate * substrateConcentration dt
  optimizationConstraintTerm : optimizationConstraint
  objectiveFunctionDefinedTerm : objectiveFunctionDefined

structure FedBatchEvidence {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} {P : ProductFormationPackage M C} (F : FedBatchPackage P) where
  optimizationConstraintClosed : F.optimizationConstraint
  objectiveFunctionClosed : F.objectiveFunctionDefined
  feedingRateNonnegative : F.feedingRate ≥ 0

def FedBatchClosed {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} {P : ProductFormationPackage M C} (F : FedBatchPackage P) : Prop :=
  F.optimizationConstraint ∧ F.objectiveFunctionDefined ∧ F.feedingRate ≥ 0

theorem fed_batch_closed_from_evidence {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} {P : ProductFormationPackage M C} (F : FedBatchPackage P) (E : FedBatchEvidence F) : FedBatchClosed F := by
  exact And.intro E.optimizationConstraintClosed (And.intro E.objectiveFunctionClosed E.feedingRateNonnegative)

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
