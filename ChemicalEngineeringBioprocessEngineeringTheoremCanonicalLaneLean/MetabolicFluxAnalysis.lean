import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure MetabolicFluxAnalysisPackage where
  stoichiometricMatrix : Prop
  fluxDistribution : Prop
  growthRate : Prop
  byproductFlux : Prop
  atpRequirements : Prop
  nadphRequirements : Prop
  redoxBalance : Prop
  pOslip : Prop

structure MetabolicFluxAnalysisEvidence (M : MetabolicFluxAnalysisPackage) where
  stoichiometricMatrixClosed : M.stoichiometricMatrix
  fluxDistributionClosed : M.fluxDistribution
  growthRateClosed : M.growthRate
  byproductFluxClosed : M.byproductFlux
  atpRequirementsClosed : M.atpRequirements
  nadphRequirementsClosed : M.nadphRequirements
  redoxBalanceClosed : M.redoxBalance
  pOslipClosed : M.pOslip

def MetabolicFluxAnalysisClosed (M : MetabolicFluxAnalysisPackage) : Prop :=
  M.stoichiometricMatrix ∧ M.fluxDistribution ∧ M.growthRate ∧
  M.byproductFlux ∧ M.atpRequirements ∧ M.nadphRequirements ∧
  M.redoxBalance ∧ M.pOslip

theorem metabolic_flux_analysis_closed_from_evidence
    (M : MetabolicFluxAnalysisPackage) (E : MetabolicFluxAnalysisEvidence M) :
    MetabolicFluxAnalysisClosed M := by
  exact And.intro E.stoichiometricMatrixClosed
    (And.intro E.fluxDistributionClosed
      (And.intro E.growthRateClosed
        (And.intro E.byproductFluxClosed
          (And.intro E.atpRequirementsClosed
            (And.intro E.nadphRequirementsClosed
              (And.intro E.redoxBalanceClosed E.pOslipClosed))))))

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse