import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.MichaelisMentenKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure CSTRPackage (M : MichaelisMentenPackage) where
  flowRate : ℝ
  inletConcentration : ℝ
  volume : ℝ
  dilutionRate : ℝ
  conversion : ℝ
  massBalanceEquation : flowRate * (inletConcentration - substrateConcentration) - volume * reactionRate = 0
  massBalanceEquationTerm : massBalanceEquation

structure CSTREvidence {M : MichaelisMentenPackage} (C : CSTRPackage M) where
  massBalanceEquationClosed : C.massBalanceEquation
  dilutionRatePositive : C.dilutionRate > 0

def CSTRClosed {M : MichaelisMentenPackage} (C : CSTRPackage M) : Prop :=
  C.massBalanceEquation ∧ C.dilutionRate > 0

theorem cstr_closed_from_evidence {M : MichaelisMentenPackage} (C : CSTRPackage M) (E : CSTREvidence C) : CSTRClosed C := by
  exact And.intro E.massBalanceEquationClosed E.dilutionRatePositive

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
