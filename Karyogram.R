# R script 
# How to plot SNP dfistribution on the chromosomes (whole genome)
# Solution One!
## Linhua Sun Wed Jun 22 20:10:51 2016

library(ggbio)
library(GenomicRanges)

test_gr<-read.table("~/Downloads/test.txt",header = F)
head(test_gr)
gr<-GRanges(seqnames = test_gr$V1,ranges = IRanges(start = test_gr$V2,width = 1))
## <https://support.bioconductor.org/p/62960/>

## Sort GRanges
## sort() will sort a GRanges object by seqnames, strand, start, and end.
head(gr)
seqlevels(gr)
gr<-sortSeqlevels(gr)
seqlevels(gr) 
gr <- sort(gr)

head(gr)
seqlevelsStyle(gr)<-"NCBI"
head(gr)
seqlengths(gr)

#geom(ideogram) need valid seqlengths information for accurate mapping
autoplot(gr,layout="karyogram")

#get accurate seqlengths information from BSGenome

library(BSgenome.Osativa.MSU.MSU7)
BSgenome.Osativa.MSU.MSU7
seqlevelsStyle(BSgenome.Osativa.MSU.MSU7)<-"NCBI"
seqlevels(BSgenome.Osativa.MSU.MSU7)

seqlengths(BSgenome.Osativa.MSU.MSU7)[1:12]

#add seqlengths info from BSGenome to GRanges objects
names(seqlengths(gr))

seqlengths(gr)<-seqlengths(BSgenome.Osativa.MSU.MSU7)[names(seqlengths(gr))]

seqlengths(gr)

seqlevels(gr)

seqlevels(gr)<-paste0("chr",c(1:12))

p<-autoplot(gr,layout="karyogram",size=0.2,color="blue")

p+theme(strip.text.y=element_text(hjust = 0,color="black",size=16,family = "Times",angle =0),strip.background=element_rect(fill = "white"),plot.background=element_rect(fill = "white"),panel.background=element_rect(fill = "white"),axis.line.x=element_line(color="black",size = 2,linetype = "solid"),axis.text.x=element_text(color="black",size = 16),text=element_text(family = "Times"))

