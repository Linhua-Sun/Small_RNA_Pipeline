# How to guess the adapter sequence from raw sequencing data without from metadata from company

1. You can read the paper "Kraken: A set of tools for quality control and analysis of high-throughput sequence data", published by EMBL. They also develop a software suite called Kraken. The website is http://www.ebi.ac.uk/research/enright/software/kraken.

2. You can also usr the little perl script "find_3p_adapter.pl". It is based on the MiRNA. You need to support it with the sequence of MiRNA.


	>Choice of microRNA
	>Hopefully you know the sequence of a few microRNAs that should be highly abundant in your sample. In plants, I routinely use **ath-miR156a, ath-miR166a, and ath-miR390a**, as they are all highly conserved and often highly expressed in most samples.

	use http://www.mirbase.org/cgi-bin/get_seq.pl?acc=MIMAT0000166 The sequence is "UGACAGAAGAGAGUGAGCAC". Transform it with U2T.
	example : `gzip -dc ./RAW-DATA-2016-07-19/BN1_141/BN1_141_R1.fq.gz | find_3p_adapter.pl -m TGACAGAAGAGAGTGAGCAC < /dev/stdin` 

 
