\name{addGenomeData-ExpressionSet}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Alias
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\alias{addGenomeData}
\alias{addGenomeData-method}
\alias{addGenomeData,ExpressionSet,DNAStringSet,refJunctions-method}
%
\title{Add MaxEnt-scores, Exon-Intron junction sequences score
    to Feature Data in \code{ExpressionSet} object.}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Description
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\description{The function takes an ExpressionSet object generated by
    \code{readExpSet}, annotates featureData
    and adds MaxEnt-scores, Exon-Intron sequences
    to featureData slot.}
\usage{
    addGenomeData(object, dna, junc)
}
\arguments{
    \item{object}{ExpressionSet object generated by readExpSet.}
    \item{dna}{DNAStringSet containing genomic sequence.}
    \item{junc}{refJunctions}
}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Details
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\details{The function adds new columns to \code{featureData} as described
    in \code{varMetadata}.
    %
    The ljseq and rjseq columns contain exon-intron
    junction sequence (from xJunc, dnaRanges using featlen=3, gaplen=8).
    %
    The ldin and rdin columns contain first intronic dinucleotides
    from left and right gap-site border.
}
%
\value{ExpressionSet}
%
\author{Wolfgang Kaisers}
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% Examples
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
\examples{
# A) Names of BAM-files
bam <- character(2)
bam[1] <- system.file("extdata", "rna_fem.bam", package="spliceSites")
bam[2] <- system.file("extdata", "rna_mal.bam", package="spliceSites")

# B) Experiment Profile
prof <- data.frame(gender=c("f", "m"))
meta <- data.frame(labelDescription=names(prof), row.names=names(prof))
pd <- new("AnnotatedDataFrame", data=prof, varMetadata=meta)

# C) Read ExpressionSet
es <- readExpSet(bam, phenoData=pd)

# D) Load annotation data
ucf <- system.file("extdata", "uc_small_junc.RData", package="spliceSites")
juc <- loadGenome(ucf)

# E) Add Genome data
dnafile<-system.file("extdata","dna_small.RData",package="spliceSites")
load(dnafile)
esg <- addGenomeData(es, dna_small, juc)

}
\keyword{addGenomeData}
\keyword{gapAligns}
