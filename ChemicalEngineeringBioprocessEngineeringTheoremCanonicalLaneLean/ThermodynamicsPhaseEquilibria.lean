import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ThermodynamicsPhaseEquilibriaPackage where
  gibbsFreeEnergy : Prop
  phaseRule : Prop
  activityCoefficient : Prop
  chemicalPotential : Prop

structure ThermodynamicsPhaseEquilibriaEvidence (T : ThermodynamicsPhaseEquilibriaPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  phaseRuleClosed : T.phaseRule
  activityCoefficientClosed : T.activityCoefficient
  chemicalPotentialClosed : T.chemicalPotential

def ThermodynamicsPhaseEquilibriaClosed (T : ThermodynamicsPhaseEquilibriaPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.phaseRule ∧ T.activityCoefficient ∧ T.chemicalPotential

theorem thermodynamics_phase_equilibria_closed_from_evidence (T : ThermodynamicsPhaseEquilibriaPackage) (E : ThermodynamicsPhaseEquilibriaEvidence T) : ThermodynamicsPhaseEquilibriaClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.phaseRuleClosed (And.intro E.activityCoefficientClosed E.chemicalPotentialClosed))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse