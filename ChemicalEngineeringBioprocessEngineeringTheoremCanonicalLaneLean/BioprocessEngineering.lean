import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure BioprocessEngineeringPackage where
  substrateUtilization : Prop
  biomassGrowth : Prop
  productFormation : Prop
  massTransfer : Prop
  reactorDesign : Prop

structure BioprocessEngineeringEvidence (B : BioprocessEngineeringPackage) where
  substrateUtilizationClosed : B.substrateUtilization
  biomassGrowthClosed : B.biomassGrowth
  productFormationClosed : B.productFormation
  massTransferClosed : B.massTransfer
  reactorDesignClosed : B.reactorDesign

def BioprocessEngineeringClosed (B : BioprocessEngineeringPackage) : Prop :=
  B.substrateUtilization ∧ B.biomassGrowth ∧ B.productFormation ∧ B.massTransfer ∧ B.reactorDesign

theorem bioprocess_engineering_closed_from_evidence (B : BioprocessEngineeringPackage) (E : BioprocessEngineeringEvidence B) : BioprocessEngineeringClosed B := by
  exact And.intro E.substrateUtilizationClosed
    (And.intro E.biomassGrowthClosed
      (And.intro E.productFormationClosed
        (And.intro E.massTransferClosed E.reactorDesignClosed)))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
