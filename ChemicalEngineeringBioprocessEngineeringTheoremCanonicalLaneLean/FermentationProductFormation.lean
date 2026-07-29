import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.ChemostatMassBalance

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ProductFormationPackage (M : MonodGrowthPackage) (C : ChemostatMassBalancePackage M) where
  productConcentration : ℝ
  productYield : ℝ
  productFormationRate : ℝ
  productBalance : dilutionRate * (0 - productConcentration) + productFormationRate = 0
  productFormationEquation : productFormationRate = productYield * specificGrowthRate * biomassConcentration
  productBalanceTerm : productBalance
  productFormationEquationTerm : productFormationEquation

structure ProductFormationEvidence {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} (P : ProductFormationPackage M C) where
  productBalanceClosed : P.productBalance
  productFormationEquationClosed : P.productFormationEquation
  productYieldPositive : P.productYield > 0

def ProductFormationClosed {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} (P : ProductFormationPackage M C) : Prop :=
  P.productBalance ∧ P.productFormationEquation ∧ P.productYield > 0

theorem product_formation_closed_from_evidence {M : MonodGrowthPackage} {C : ChemostatMassBalancePackage M} (P : ProductFormationPackage M C) (E : ProductFormationEvidence P) : ProductFormationClosed P := by
  exact And.intro E.productBalanceClosed (And.intro E.productFormationEquationClosed E.productYieldPositive)

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
