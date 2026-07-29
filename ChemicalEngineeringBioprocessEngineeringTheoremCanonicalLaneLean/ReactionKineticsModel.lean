import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ReactionKineticsModel where
  substrateConc : ℝ
  enzymeConc : ℝ
  productConc : ℝ
  reactionRate : ℝ
  inhibitionConstant : ℝ
  michaelisMentenAffinity : ℝ
  temperature : ℝ
  pH : ℝ
  constraintPassed : Prop
  constraintPassedTerm : constraintPassed

structure ReactionKineticsEvidence (R : ReactionKineticsModel) where
  substrateConcClosed : R.substrateConc > 0
  enzymeConcClosed : R.enzymeConc > 0
  productConcClosed : R.productConc ≥ 0
  reactionRateClosed : R.reactionRate > 0
  inhibitionConstantClosed : R.inhibitionConstant > 0
  michaelisMentenAffinityClosed : R.michaelisMentenAffinity > 0

structure ReactionKineticsEvidenceExtended (R : ReactionKineticsModel) (E : ReactionKineticsEvidence R) where
  temperatureInRange : R.temperature > 273.15 ∧ R.temperature < 373.15
  pHInRange : R.pH ≥ 6.0 ∧ R.pH ≤ 8.0
  constraintPassedFromModel : R.constraintPassed

def ReactionKineticsClosed (R : ReactionKineticsModel) : Prop :=
  R.substrateConc > 0 ∧ R.enzymeConc > 0 ∧ R.productConc ≥ 0 ∧
  R.reactionRate > 0 ∧ R.inhibitionConstant > 0 ∧ R.michaelisMentenAffinity > 0

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsModel) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.substrateConcClosed
    (And.intro E.enzymeConcClosed
      (And.intro E.productConcClosed
        (And.intro E.reactionRateClosed
          (And.intro E.inhibitionConstantClosed
            E.michaelisMentenAffinityClosed))))

theorem reaction_kinetics_closure_with_extended (R : ReactionKineticsModel) (E : ReactionKineticsEvidence R) (Ex : ReactionKineticsEvidenceExtended R E) :
    ReactionKineticsClosed R := by
  exact reaction_kinetics_closed_from_evidence R E

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse