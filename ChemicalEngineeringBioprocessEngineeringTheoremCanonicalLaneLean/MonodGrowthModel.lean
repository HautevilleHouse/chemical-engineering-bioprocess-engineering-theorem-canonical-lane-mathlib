import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure MonodGrowthPackage where
  specificGrowthRate : ℝ
  maximumGrowthRate : ℝ
  halfSaturationConstant : ℝ
  limitingSubstrateConcentration : ℝ
  monodEquation : specificGrowthRate = (maximumGrowthRate * limitingSubstrateConcentration) / (halfSaturationConstant + limitingSubstrateConcentration)
  monodEquationTerm : monodEquation

structure MonodGrowthEvidence (M : MonodGrowthPackage) where
  monodEquationClosed : M.monodEquation
  maximumGrowthRatePositive : M.maximumGrowthRate > 0
  halfSaturationConstantPositive : M.halfSaturationConstant > 0

def MonodGrowthClosed (M : MonodGrowthPackage) : Prop :=
  M.monodEquation ∧ M.maximumGrowthRate > 0 ∧ M.halfSaturationConstant > 0

theorem monod_growth_closed_from_evidence (M : MonodGrowthPackage) (E : MonodGrowthEvidence M) : MonodGrowthClosed M := by
  exact And.intro E.monodEquationClosed (And.intro E.maximumGrowthRatePositive E.halfSaturationConstantPositive)

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
