maria_report.html: maria_report.Rmd \
	output/table1.rds output/figure1.png
	Rscript code/03_render_report.R

output/table1.rds: code/01_make_table1.R \
	data/male_w_heartattack_analysis.csv
	Rscript code/01_make_table1.R

output/figure1.png: code/02_make_figure1.R \
	data/male_w_heartattack_analysis.csv
	Rscript code/02_make_figure1.R
	
output/figure2.png: code/02_make_figure2.R \
	data/male_w_heartattack_analysis.csv
	Rscript code/02_make_figure2.R

install:
 Rscript -e "renv::restore()"
