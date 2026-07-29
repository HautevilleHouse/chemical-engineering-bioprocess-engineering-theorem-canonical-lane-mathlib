import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure EnzymeKineticsPackage where
  michaelisConstant : Prop
  turnoverNumber : Prop
  catalyticEfficiency : Prop
  substrateInhibition : Prop
  productInhibition : Prop
  competitiveInhibition : Prop
  uncompetitiveInhibition : Prop
  noncompetitiveInhibition : Prop

structure EnzymeKineticsEvidence (E : EnzymeKineticsPackage) where
  michaelisConstantClosed : E.michaelisConstant
  turnoverNumberClosed : E.turnoverNumber
  catalyticEfficiencyClosed : E.catalyticEfficiency
  substrateInhibitionClosed : E.substrateInhibition
  productInhibitionClosed : E.productInhibition
  competitiveInhibitionClosed : E.competitiveInhibition
  uncompetitiveInhibitionClosed : E.uncompetitiveInhibition
  noncompetitiveInhibitionClosed : E.noncompetitiveInhibition

def EnzymeKineticsClosed (E : EnzymeKineticsPackage) : Prop :=
  E.michaelisConstant ∧ E.turnoverNumber ∧ E.catalyticEfficiency ∧
  E.substrateInhibition ∧ E.productInhibition ∧
  E.competitiveInhibition ∧ E.uncompetitiveInhibition ∧ E.noncompetitiveInhibition

theorem enzyme_kinetics_closed_from_evidence
    (E : EnzymeKineticsPackage) (Ev : EnzymeKineticsEvidence E) :
    EnzymeKineticsClosed E := by
  exact And.intro Ev.michaelisConstantClosed
    (And.intro Ev.turnoverNumberClosed
      (And.intro Ev.catalyticEfficiencyClosed
        (And.intro Ev.substrateInhibitionClosed
          (And.intro Ev.productInhibitionClosed
            (And.intro Ev.competitiveInhibitionClosed
              (And.intro Ev.uncompetitiveInhibitionClosed Ev.noncompetitiveInhibitionClosed))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse