import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.MonodGrowthModel

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ChemostatMassBalancePackage (M : MonodGrowthPackage) where
  biomassConcentration : ℝ
  dilutionRate : ℝ
  yieldCoefficient : ℝ
  inletSubstrateConcentration : ℝ
  biomassBalance : dilutionRate * (0 - biomassConcentration) + specificGrowthRate * biomassConcentration = 0
  substrateBalance : dilutionRate * (inletSubstrateConcentration - limitingSubstrateConcentration) - (specificGrowthRate * biomassConcentration) / yieldCoefficient = 0
  biomassBalanceTerm : biomassBalance
  substrateBalanceTerm : substrateBalance

structure ChemostatMassBalanceEvidence {M : MonodGrowthPackage} (C : ChemostatMassBalancePackage M) where
  biomassBalanceClosed : C.biomassBalance
  substrateBalanceClosed : C.substrateBalance
  yieldCoefficientPositive : C.yieldCoefficient > 0

def ChemostatMassBalanceClosed {M : MonodGrowthPackage} (C : ChemostatMassBalancePackage M) : Prop :=
  C.biomassBalance ∧ C.substrateBalance ∧ C.yieldCoefficient > 0

theorem chemostat_mass_balance_closed_from_evidence {M : MonodGrowthPackage} (C : ChemostatMassBalancePackage M) (E : ChemostatMassBalanceEvidence C) : ChemostatMassBalanceClosed C := by
  exact And.intro E.biomassBalanceClosed (And.intro E.substrateBalanceClosed E.yieldCoefficientPositive)

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
