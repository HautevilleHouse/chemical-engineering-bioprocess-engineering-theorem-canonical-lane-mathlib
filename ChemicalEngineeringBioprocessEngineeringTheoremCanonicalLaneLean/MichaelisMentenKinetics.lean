import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure MichaelisMentenPackage where
  substrateConcentration : ℝ
  enzymeConcentration : ℝ
  reactionRate : ℝ
  kM : ℝ
  kCat : ℝ
  rateEquation : rate = (kCat * enzymeConcentration * substrateConcentration) / (kM + substrateConcentration)
  rateEquationTerm : rateEquation

structure MichaelisMentenEvidence (M : MichaelisMentenPackage) where
  rateEquationClosed : M.rateEquation
  kMPositive : M.kM > 0
  kCatPositive : M.kCat > 0

def MichaelisMentenClosed (M : MichaelisMentenPackage) : Prop :=
  M.rateEquation ∧ M.kM > 0 ∧ M.kCat > 0

theorem michaelis_menten_closed_from_evidence (M : MichaelisMentenPackage) (E : MichaelisMentenEvidence M) : MichaelisMentenClosed M := by
  exact And.intro E.rateEquationClosed (And.intro E.kMPositive E.kCatPositive)

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
