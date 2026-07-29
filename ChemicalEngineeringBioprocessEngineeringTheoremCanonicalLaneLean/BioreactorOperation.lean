import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure BioreactorOperationPackage where
  flowMode : Prop
  dilutionRate : Prop
  inletSubstrateConcentration : Prop
  outletSubstrateConcentration : Prop
  biomassConcentration : Prop
  productivity : Prop

structure BioreactorOperationEvidence (B : BioreactorOperationPackage) where
  flowModeClosed : B.flowMode
  dilutionRateClosed : B.dilutionRate
  inletSubstrateConcentrationClosed : B.inletSubstrateConcentration
  outletSubstrateConcentrationClosed : B.outletSubstrateConcentration
  biomassConcentrationClosed : B.biomassConcentration
  productivityClosed : B.productivity

def BioreactorOperationClosed (B : BioreactorOperationPackage) : Prop :=
  B.flowMode ∧ B.dilutionRate ∧ B.inletSubstrateConcentration ∧
  B.outletSubstrateConcentration ∧ B.biomassConcentration ∧ B.productivity

theorem bioreactor_operation_closed_from_evidence
    (B : BioreactorOperationPackage) (E : BioreactorOperationEvidence B) :
    BioreactorOperationClosed B := by
  exact And.intro E.flowModeClosed
    (And.intro E.dilutionRateClosed
      (And.intro E.inletSubstrateConcentrationClosed
        (And.intro E.outletSubstrateConcentrationClosed
          (And.intro E.biomassConcentrationClosed E.productivityClosed))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse