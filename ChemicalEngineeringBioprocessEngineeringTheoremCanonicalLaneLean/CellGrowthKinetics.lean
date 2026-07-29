import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure CellGrowthKineticsPackage where
  specificGrowthRate : Prop
  substrateLimitation : Prop
  inhibitionEffect : Prop
  productFormation : Prop

structure CellGrowthKineticsEvidence (C : CellGrowthKineticsPackage) where
  specificGrowthRateClosed : C.specificGrowthRate
  substrateLimitationClosed : C.substrateLimitation
  inhibitionEffectClosed : C.inhibitionEffect
  productFormationClosed : C.productFormation

def CellGrowthKineticsClosed (C : CellGrowthKineticsPackage) : Prop :=
  C.specificGrowthRate ∧ C.substrateLimitation ∧ C.inhibitionEffect ∧ C.productFormation

theorem cell_growth_kinetics_closed_from_evidence (C : CellGrowthKineticsPackage) (E : CellGrowthKineticsEvidence C) : CellGrowthKineticsClosed C := by
  exact And.intro E.specificGrowthRateClosed (And.intro E.substrateLimitationClosed (And.intro E.inhibitionEffectClosed E.productFormationClosed))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse