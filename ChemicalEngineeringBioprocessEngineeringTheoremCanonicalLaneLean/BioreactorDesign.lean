import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure BioreactorDesignPackage where
  reactorType : Prop
  residenceTime : Prop
  sterilizationEfficiency : Prop
  scalingCriteria : Prop

structure BioreactorDesignEvidence (B : BioreactorDesignPackage) where
  reactorTypeClosed : B.reactorType
  residenceTimeClosed : B.residenceTime
  sterilizationEfficiencyClosed : B.sterilizationEfficiency
  scalingCriteriaClosed : B.scalingCriteria

def BioreactorDesignClosed (B : BioreactorDesignPackage) : Prop :=
  B.reactorType ∧ B.residenceTime ∧ B.sterilizationEfficiency ∧ B.scalingCriteria

theorem bioreactor_design_closed_from_evidence (B : BioreactorDesignPackage) (E : BioreactorDesignEvidence B) : BioreactorDesignClosed B := by
  exact And.intro E.reactorTypeClosed (And.intro E.residenceTimeClosed (And.intro E.sterilizationEfficiencyClosed E.scalingCriteriaClosed))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse