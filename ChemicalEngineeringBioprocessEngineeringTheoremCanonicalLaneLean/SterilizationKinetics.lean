import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.MassTransfer

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure SterilizationKineticsPackage {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} where
  thermalDeathModel : Prop
  arrheniusTemperatureDependence : Prop
  decimalReductionTime : Prop
  sterilityAssuranceLevel : Prop
  reactorSterilization : Prop

structure SterilizationKineticsEvidence {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} (S : SterilizationKineticsPackage M) where
  thermalDeathModelClosed : S.thermalDeathModel
  arrheniusTemperatureDependenceClosed : S.arrheniusTemperatureDependence
  decimalReductionTimeClosed : S.decimalReductionTime
  sterilityAssuranceLevelClosed : S.sterilityAssuranceLevel
  reactorSterilizationClosed : S.reactorSterilization

def SterilizationKineticsClosed {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} (S : SterilizationKineticsPackage M) : Prop :=
  S.thermalDeathModel ∧ S.arrheniusTemperatureDependence ∧ S.decimalReductionTime ∧ S.sterilityAssuranceLevel ∧ S.reactorSterilization

theorem sterilization_kinetics_closed_from_evidence {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} (S : SterilizationKineticsPackage M) (E : SterilizationKineticsEvidence S) :
    SterilizationKineticsClosed S := by
  exact And.intro E.thermalDeathModelClosed (And.intro E.arrheniusTemperatureDependenceClosed (And.intro E.decimalReductionTimeClosed (And.intro E.sterilityAssuranceLevelClosed E.reactorSterilizationClosed)))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse