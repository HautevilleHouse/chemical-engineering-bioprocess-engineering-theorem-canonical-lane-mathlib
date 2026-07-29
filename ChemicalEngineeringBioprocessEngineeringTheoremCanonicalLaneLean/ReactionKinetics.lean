import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ReactionKineticsPackage where
  rateLaw : Prop
  activationEnergy : Prop
  preExponentialFactor : Prop
  reactionOrder : Prop
  equilibriumConstant : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateLawClosed : R.rateLaw
  activationEnergyClosed : R.activationEnergy
  preExponentialFactorClosed : R.preExponentialFactor
  reactionOrderClosed : R.reactionOrder
  equilibriumConstantClosed : R.equilibriumConstant

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.rateLaw ∧ R.activationEnergy ∧ R.preExponentialFactor ∧ R.reactionOrder ∧ R.equilibriumConstant

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R := by
  exact And.intro E.rateLawClosed
    (And.intro E.activationEnergyClosed
      (And.intro E.preExponentialFactorClosed
        (And.intro E.reactionOrderClosed E.equilibriumConstantClosed)))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
