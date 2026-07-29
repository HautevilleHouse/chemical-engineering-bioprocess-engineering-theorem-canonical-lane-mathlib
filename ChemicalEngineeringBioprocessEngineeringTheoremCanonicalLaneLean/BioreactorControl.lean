import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.ReactionKineticsModel
import ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.FermentorMassBalance

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure BioreactorControl where
  setpointBiomass : ℝ
  setpointSubstrate : ℝ
  setpointProduct : ℝ
  measuredBiomass : ℝ
  measuredSubstrate : ℝ
  measuredProduct : ℝ
  controlAction : ℝ
  disturbance : ℝ
  stabilityMargin : ℝ
  controlStable : Prop
  controlStableTerm : controlStable

structure BioreactorControlEvidence (C : BioreactorControl) where
  setpointBiomassClosed : C.setpointBiomass > 0
  setpointSubstrateClosed : C.setpointSubstrate > 0
  setpointProductClosed : C.setpointProduct ≥ 0
  measuredBiomassClosed : C.measuredBiomass > 0
  measuredSubstrateClosed : C.measuredSubstrate > 0
  measuredProductClosed : C.measuredProduct ≥ 0
  controlActionClosed : C.controlAction ≠ 0
  disturbanceClosed : C.disturbance ≥ 0
  stabilityMarginClosed : C.stabilityMargin > 0
  deviationBiomass : |C.setpointBiomass - C.measuredBiomass| < C.stabilityMargin
  deviationSubstrate : |C.setpointSubstrate - C.measuredSubstrate| < C.stabilityMargin
  deviationProduct : |C.setpointProduct - C.measuredProduct| < C.stabilityMargin

def BioreactorControlClosed (C : BioreactorControl) : Prop :=
  C.setpointBiomass > 0 ∧ C.setpointSubstrate > 0 ∧ C.setpointProduct ≥ 0 ∧
  C.measuredBiomass > 0 ∧ C.measuredSubstrate > 0 ∧ C.measuredProduct ≥ 0 ∧
  C.controlAction ≠ 0 ∧ C.disturbance ≥ 0 ∧ C.stabilityMargin > 0 ∧
  |C.setpointBiomass - C.measuredBiomass| < C.stabilityMargin ∧
  |C.setpointSubstrate - C.measuredSubstrate| < C.stabilityMargin ∧
  |C.setpointProduct - C.measuredProduct| < C.stabilityMargin

theorem bioreactor_control_closed_from_evidence (C : BioreactorControl) (E : BioreactorControlEvidence C) :
    BioreactorControlClosed C := by
  exact And.intro E.setpointBiomassClosed
    (And.intro E.setpointSubstrateClosed
      (And.intro E.setpointProductClosed
        (And.intro E.measuredBiomassClosed
          (And.intro E.measuredSubstrateClosed
            (And.intro E.measuredProductClosed
              (And.intro E.controlActionClosed
                (And.intro E.disturbanceClosed
                  (And.intro E.stabilityMarginClosed
                    (And.intro E.deviationBiomass
                      (And.intro E.deviationSubstrate
                        E.deviationProduct))))))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse