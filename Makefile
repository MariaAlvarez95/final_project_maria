all: report

report: FinalProyect2_Maria_Alvarez.html

FinalProyect2_Maria_Alvarez.html: FinalProyect2_Maria_Alvarez.Rmd code/data_preparation.R code/descriptive_statistics.R code/figures.R

Rscript -e "rmarkdown::render('FinalProyect2_Maria_Alvarez.Rmd')"
