import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure BioreactorModelingPackage {K : ReactionKineticsPackage} where
  reactorType : Type u
  massBalance : Prop
  energyBalance : Prop
  transportPhenomena : Prop
  kineticCoupling : Prop

structure BioreactorModelingEvidence {K : ReactionKineticsPackage} (B : BioreactorModelingPackage K) where
  massBalanceClosed : B.massBalance
  energyBalanceClosed : B.energyBalance
  transportPhenomenaClosed : B.transportPhenomena
  kineticCouplingClosed : B.kineticCoupling

def BioreactorModelingClosed {K : ReactionKineticsPackage} (B : BioreactorModelingPackage K) : Prop :=
  B.massBalance ∧ B.energyBalance ∧ B.transportPhenomena ∧ B.kineticCoupling

theorem bioreactor_modeling_closed_from_evidence {K : ReactionKineticsPackage} (B : BioreactorModelingPackage K) (E : BioreactorModelingEvidence B) :
    BioreactorModelingClosed B := by
  exact And.intro E.massBalanceClosed (And.intro E.energyBalanceClosed (And.intro E.transportPhenomenaClosed E.kineticCouplingClosed))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse