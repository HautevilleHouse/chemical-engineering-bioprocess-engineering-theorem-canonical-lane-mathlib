import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.SterilizationKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ProductRecoveryPackage {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} {S : SterilizationKineticsPackage M} where
  cellHarvesting : Prop
  productExtraction : Prop
  purificationSteps : Prop
  yieldOptimization : Prop
  qualityControl : Prop

structure ProductRecoveryEvidence {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} {S : SterilizationKineticsPackage M} (P : ProductRecoveryPackage S) where
  cellHarvestingClosed : P.cellHarvesting
  productExtractionClosed : P.productExtraction
  purificationStepsClosed : P.purificationSteps
  yieldOptimizationClosed : P.yieldOptimization
  qualityControlClosed : P.qualityControl

def ProductRecoveryClosed {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} {S : SterilizationKineticsPackage M} (P : ProductRecoveryPackage S) : Prop :=
  P.cellHarvesting ∧ P.productExtraction ∧ P.purificationSteps ∧ P.yieldOptimization ∧ P.qualityControl

theorem product_recovery_closed_from_evidence {K : ReactionKineticsPackage} {B : BioreactorModelingPackage K} {G : CellGrowthKineticsPackage B} {M : MassTransferPackage G} {S : SterilizationKineticsPackage M} (P : ProductRecoveryPackage S) (E : ProductRecoveryEvidence P) :
    ProductRecoveryClosed P := by
  exact And.intro E.cellHarvestingClosed (And.intro E.productExtractionClosed (And.intro E.purificationStepsClosed (And.intro E.yieldOptimizationClosed E.qualityControlClosed)))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse