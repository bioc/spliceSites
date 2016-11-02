\name{addGenomeData-gapSites}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Alias
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\alias{addGenomeData,gapSites,DNAStringSet,refJunctions-method}
%
\title{Add MaxEnt-scores, Exon-Intron junction sequences score
    to Feature Data in \code{gapSites} object.}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Description
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\description{The function takes an gapSites object,
    adds annotation data, MaxEnt-scores, Exon-Intron sequences
    to featureData slot.}
%
\arguments{
    \item{object}{gapSites object}
    \item{dna}{DNAStringSet containing genomic sequence.}
    \item{junc}{refJunctions}
}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Details
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\details{The function adds new columns to \code{featureData} as described
    in \code{varMetadata}.
}
%
\value{gapSites}
%
\author{Wolfgang Kaisers}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Examples
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\examples{
# A) Read gapSites
bam <- system.file("extdata", "rna_fem.bam", package="spliceSites")
reader <- bamReader(bam, idx=TRUE)
ga <- alignGapList(reader)
bamClose(reader)

# B) Load DNA
dnafile <- system.file("extdata", "dna_small.RData", package="spliceSites")
load(dnafile)

# C) maxEnt
mes<-load.maxEnt()
gae<-addMaxEnt(ga,dna_small,mes)
getMeStrand(gae)
sae<-setMeStrand(gae)

# D) Load annotation data
ucf <- system.file("extdata", "uc_small_junc.RData", package="spliceSites")
juc <- loadGenome(ucf)

esg <- addGenomeData(ga, dna_small, juc)

}
\keyword{addGenomeData}
\keyword{gapAligns}
