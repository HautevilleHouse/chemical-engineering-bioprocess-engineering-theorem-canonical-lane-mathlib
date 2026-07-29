import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ThermodynamicConsistency where
  temperature : ℝ
  pressure : ℝ
  enthalpyChange : ℝ
  entropyChange : ℝ
  gibbsFreeEnergyChange : ℝ
  equilibriumConstant : ℝ
  activationEnergy : ℝ
  reactionHeat : ℝ
  consistencySatisfied : Prop
  consistencySatisfiedTerm : consistencySatisfied

structure ThermodynamicConsistencyEvidence (T : ThermodynamicConsistency) where
  temperatureClosed : T.temperature > 0
  pressureClosed : T.pressure > 0
  enthalpyChangeClosed : T.enthalpyChange ≠ 0
  entropyChangeClosed : T.entropyChange ≠ 0
  gibbsFreeEnergyChangeClosed : T.gibbsFreeEnergyChange ≠ 0
  equilibriumConstantClosed : T.equilibriumConstant > 0
  activationEnergyClosed : T.activationEnergy > 0
  reactionHeatClosed : T.reactionHeat ≠ 0
  gibbsFreeEnergyFormula : T.gibbsFreeEnergyChange = T.enthalpyChange - T.temperature * T.entropyChange

def ThermodynamicConsistencyClosed (T : ThermodynamicConsistency) : Prop :=
  T.temperature > 0 ∧ T.pressure > 0 ∧ T.enthalpyChange ≠ 0 ∧
  T.entropyChange ≠ 0 ∧ T.gibbsFreeEnergyChange ≠ 0 ∧
  T.equilibriumConstant > 0 ∧ T.activationEnergy > 0 ∧ T.reactionHeat ≠ 0 ∧
  T.gibbsFreeEnergyChange = T.enthalpyChange - T.temperature * T.entropyChange

theorem thermodynamic_consistency_closed_from_evidence (T : ThermodynamicConsistency) (E : ThermodynamicConsistencyEvidence T) :
    ThermodynamicConsistencyClosed T := by
  exact And.intro E.temperatureClosed
    (And.intro E.pressureClosed
      (And.intro E.enthalpyChangeClosed
        (And.intro E.entropyChangeClosed
          (And.intro E.gibbsFreeEnergyChangeClosed
            (And.intro E.equilibriumConstantClosed
              (And.intro E.activationEnergyClosed
                (And.intro E.reactionHeatClosed
                  E.gibbsFreeEnergyFormula)))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse