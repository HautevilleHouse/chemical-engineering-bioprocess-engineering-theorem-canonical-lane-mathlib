import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure MassTransferBioreactorPackage where
  oxygenTransferRate : Prop
  klaCoefficient : Prop
  gasLiquidMassTransfer : Prop
  mixingEfficiency : Prop

structure MassTransferBioreactorEvidence (M : MassTransferBioreactorPackage) where
  oxygenTransferRateClosed : M.oxygenTransferRate
  klaCoefficientClosed : M.klaCoefficient
  gasLiquidMassTransferClosed : M.gasLiquidMassTransfer
  mixingEfficiencyClosed : M.mixingEfficiency

def MassTransferBioreactorClosed (M : MassTransferBioreactorPackage) : Prop :=
  M.oxygenTransferRate ∧ M.klaCoefficient ∧ M.gasLiquidMassTransfer ∧ M.mixingEfficiency

theorem mass_transfer_bioreactor_closed_from_evidence (M : MassTransferBioreactorPackage) (E : MassTransferBioreactorEvidence M) : MassTransferBioreactorClosed M := by
  exact And.intro E.oxygenTransferRateClosed (And.intro E.klaCoefficientClosed (And.intro E.gasLiquidMassTransferClosed E.mixingEfficiencyClosed))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse