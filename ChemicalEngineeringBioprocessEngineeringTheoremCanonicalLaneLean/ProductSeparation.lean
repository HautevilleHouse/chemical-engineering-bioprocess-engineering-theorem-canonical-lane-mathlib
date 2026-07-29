import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure ProductSeparation where
  feedConcentration : ℝ
  productConcentrationRetentate : ℝ
  productConcentrationPermeate : ℝ
  membraneArea : ℝ
  transmembranePressure : ℝ
  rejectionCoefficient : ℝ
  recoveryFactor : ℝ
  separationEfficiency : ℝ
  purityRequirement : Prop
  purityRequirementTerm : purityRequirement

structure ProductSeparationEvidence (S : ProductSeparation) where
  feedConcentrationClosed : S.feedConcentration > 0
  productConcentrationRetentateClosed : S.productConcentrationRetentate ≥ 0
  productConcentrationPermeateClosed : S.productConcentrationPermeate ≥ 0
  membraneAreaClosed : S.membraneArea > 0
  transmembranePressureClosed : S.transmembranePressure > 0
  rejectionCoefficientClosed : S.rejectionCoefficient > 0 ∧ S.rejectionCoefficient < 1
  recoveryFactorClosed : S.recoveryFactor > 0 ∧ S.recoveryFactor < 1
  separationEfficiencyClosed : S.separationEfficiency > 0 ∧ S.separationEfficiency < 1
  purityRequirementClosed : S.purityRequirement

def ProductSeparationClosed (S : ProductSeparation) : Prop :=
  S.feedConcentration > 0 ∧ S.productConcentrationRetentate ≥ 0 ∧
  S.productConcentrationPermeate ≥ 0 ∧ S.membraneArea > 0 ∧
  S.transmembranePressure > 0 ∧ (S.rejectionCoefficient > 0 ∧ S.rejectionCoefficient < 1) ∧
  (S.recoveryFactor > 0 ∧ S.recoveryFactor < 1) ∧
  (S.separationEfficiency > 0 ∧ S.separationEfficiency < 1) ∧ S.purityRequirement

theorem product_separation_closed_from_evidence (S : ProductSeparation) (E : ProductSeparationEvidence S) :
    ProductSeparationClosed S := by
  exact And.intro E.feedConcentrationClosed
    (And.intro E.productConcentrationRetentateClosed
      (And.intro E.productConcentrationPermeateClosed
        (And.intro E.membraneAreaClosed
          (And.intro E.transmembranePressureClosed
            (And.intro E.rejectionCoefficientClosed
              (And.intro E.recoveryFactorClosed
                (And.intro E.separationEfficiencyClosed
                  E.purityRequirementClosed)))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse