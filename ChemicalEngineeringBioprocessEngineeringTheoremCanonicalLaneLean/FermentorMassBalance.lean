import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.ReactionKineticsModel

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure FermentorMassBalance where
  feedRate : ℝ
  biomassInlet : ℝ
  substrateInlet : ℝ
  productInlet : ℝ
  reactorVolume : ℝ
  dilutionRate : ℝ
  growthRate : ℝ
  yieldCoefficient : ℝ
  maintenanceCoefficient : ℝ
  balanceSatisfied : Prop
  balanceSatisfiedTerm : balanceSatisfied

structure FermentorMassBalanceEvidence (F : FermentorMassBalance) where
  feedRateClosed : F.feedRate > 0
  biomassInletClosed : F.biomassInlet ≥ 0
  substrateInletClosed : F.substrateInlet > 0
  productInletClosed : F.productInlet ≥ 0
  reactorVolumeClosed : F.reactorVolume > 0
  dilutionRateClosed : F.dilutionRate > 0
  growthRateClosed : F.growthRate > 0
  yieldCoefficientClosed : F.yieldCoefficient > 0
  maintenanceCoefficientClosed : F.maintenanceCoefficient ≥ 0

def FermentorMassBalanceClosed (F : FermentorMassBalance) : Prop :=
  F.feedRate > 0 ∧ F.biomassInlet ≥ 0 ∧ F.substrateInlet > 0 ∧
  F.productInlet ≥ 0 ∧ F.reactorVolume > 0 ∧ F.dilutionRate > 0 ∧
  F.growthRate > 0 ∧ F.yieldCoefficient > 0 ∧ F.maintenanceCoefficient ≥ 0

theorem fermentor_mass_balance_closed_from_evidence (F : FermentorMassBalance) (E : FermentorMassBalanceEvidence F) :
    FermentorMassBalanceClosed F := by
  exact And.intro E.feedRateClosed
    (And.intro E.biomassInletClosed
      (And.intro E.substrateInletClosed
        (And.intro E.productInletClosed
          (And.intro E.reactorVolumeClosed
            (And.intro E.dilutionRateClosed
              (And.intro E.growthRateClosed
                (And.intro E.yieldCoefficientClosed
                  E.maintenanceCoefficientClosed)))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse