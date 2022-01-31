setwd("C:/Users/Zain/R/Bioinformatics")
library(stringr)
library(readr)
raw_data <- "UUU F CUU L AUU I GUU V UUC F CUC L AUC I GUC V UUA L CUA L AUA I GUA V UUG L CUG L AUG M GUG V UCU S CCU P ACU T GCU A UCC S CCC P ACC T GCC A UCA S CCA P ACA T GCA A UCG S CCG P ACG T GCG A UAU Y CAU H AAU N GAU D UAC Y CAC H AAC N GAC D UAA Stop CAA Q AAA K GAA E UAG Stop CAG Q AAG K GAG E UGU C CGU R AGU S GGU G UGC C CGC R AGC S GGC G UGA Stop CGA R AGA R GGA G UGG W CGG R AGG R GGG G"
raw_data <- strsplit(raw_data," ")[[1]]
amino_acid <- c()
codon <- c()
for (i in raw_data){
  if (nchar(i)==3){
    codon <- c(codon,i)
  }
  else {
    amino_acid <- c(amino_acid,i)
  }
}
RNAtable <- data.frame(codons =codon, val=amino_acid)
RNA <- read_file(paste0("prot.txt"))
hi <- nchar(RNA)
RNA_split<-strsplit(RNA, "(?<=.{3})", perl = TRUE)[[1]]
result <- RNAtable$val[match(RNA_split, RNAtable$codons)]
result_txt <- paste(result, collapse = "")
hi2 <- nchar(result_txt)
writeLines(result_txt, 'output.txt')