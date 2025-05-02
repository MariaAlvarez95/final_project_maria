.PHONY: all install clean docker_build docker_run

# Definir el comando de eliminación según el sistema operativo
RM := rm -rf
ifeq ($(OS),Windows_NT)
	RM := powershell -Command "Remove-Item -Recurse -Force"
endif

all: install maria_report.html

install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

maria_report.html: maria_report.Rmd \
	output/table1.rds output/figure1.rds
	Rscript code/03_render_report.R

output/table1.rds: code/01_make_table1.R \
	data/male_w_heartattack_analysis.csv
	Rscript code/01_make_table1.R

output/figure1.rds: code/02_make_figure1.R \
	data/male_w_heartattack_analysis.csv
	Rscript code/02_make_figure1.R

clean:
	$(RM) output/*.rds output/*.html

docker_build:
	docker build --platform linux/amd64 --no-cache -t maria/final_project:latest .

docker_run:
	mkdir -p report
	docker run --rm \
		-v $$(pwd)/output:/final/output \
		-v $$(pwd)/report:/final/report \
		--platform linux/amd64 \
		maria/final_project:latest \
		sh -c "make all && cp /final/output/maria_report.html /final/report/maria_report.html"
