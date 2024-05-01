#' @title DNA.vis
#' @description This function creates a summary for a single fasta file that includes frequencies of the four DNA bases, GC count, length of sequences, and two visualizations (one showing a colored image of the base pairs and the second showing relative counts of different codons or sets of three base pairs).
#' @param x - data
#' @keywords - DNA
#' @export - makes the function available for others to use when your package is loaded
DNA.vis <- function(x) {
  if (class(x)=="DNAbin")
  {
    df <- data.frame(
      labels.DNAbin(x),
      base.freq(x), #{ape}
      GC.content(x), #{ape}
      length (x))
    print(df)
    print(image.DNAbin(x))
    trios <- as.data.frame(seqinr::count(x, 3)) # {seqinr}
    ggplot(data=trios, aes(x=Var1, y=Freq, fill=Var1)) + geom_col() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  }
  else {
    print("Please use file in DNAbin format")
  }}
