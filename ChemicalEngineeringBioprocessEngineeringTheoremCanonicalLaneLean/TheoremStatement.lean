import ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  bioreactorConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "chemical-engineering-bioprocess-engineering-theorem-canonical-lane",
    theoremName := "chemical-engineering-bioprocess-engineering-theorem-canonical-lane",
    theoremObject := "Chemical Engineering Bioprocess Engineering Theorem: Reaction kinetics, transport phenomena, and bioreactor design principles,",
    classicalBoundary := "Classical source boundary: full PDE-ODE system with Michaelis-Menten kinetics, Monod kinetics, and diffusion-reaction equations.",
    bioreactorConstrainedStatement := "bioreactor-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
    certificateLane := "bioreactor_constrained",
    carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
  }

end ChemicalEngineeringBioprocessEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
