import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure MassTransferPackage where
  diffusionCoefficient : Prop
  filmMassTransferCoefficient : Prop
  gasLiquidInterfaceArea : Prop
  liquidSideResistance : Prop
  overallMassTransferCoefficient : Prop
  gasLiquidEquilibrium : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  diffusionCoefficientClosed : M.diffusionCoefficient
  filmMassTransferCoefficientClosed : M.filmMassTransferCoefficient
  gasLiquidInterfaceAreaClosed : M.gasLiquidInterfaceArea
  liquidSideResistanceClosed : M.liquidSideResistance
  overallMassTransferCoefficientClosed : M.overallMassTransferCoefficient
  gasLiquidEquilibriumClosed : M.gasLiquidEquilibrium

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.diffusionCoefficient ∧ M.filmMassTransferCoefficient ∧
  M.gasLiquidInterfaceArea ∧ M.liquidSideResistance ∧
  M.overallMassTransferCoefficient ∧ M.gasLiquidEquilibrium

theorem mass_transfer_closed_from_evidence
    (M : MassTransferPackage) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.filmMassTransferCoefficientClosed
      (And.intro E.gasLiquidInterfaceAreaClosed
        (And.intro E.liquidSideResistanceClosed
          (And.intro E.overallMassTransferCoefficientClosed E.gasLiquidEquilibriumClosed))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse