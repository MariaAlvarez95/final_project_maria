# Final Project: Analysis of Males with Heart Attack

## Description
This repository contains the code, data, and resources for the final project analyzing males with a history of heart attacks. The analysis focuses on descriptive statistics and visualizations to understand patterns and associations in the data. The final output is a compiled HTML report.

## Project Structure:

### Directories:
- `data/`: Contains the dataset `male_w_heartattack_analysis.csv`.
- `code/`: Contains R scripts for data preparation, analysis, and report generation.
- `output/`: Stores intermediate files, such as tables and figures (.rds files).
- `report/`: Contains the final compiled report in HTML format. 
- `renv/`: Ensures reproducibility by managing R package dependencies.
- `maria_report.Rmd`: R Markdown file for the final report.
- `dockerfile`: Docker configuration for containerizing the project.
- `Makefile`: Automates tasks such as building the report and cleaning outputs.
- `README.md`: This file.

## Key Scripts

`code/01_make_table1.R`:

- Processes the dataset to handle missing values and creates descriptive tables using gtsummary.
- Saves the resulting table as table1.rds in the output/ folder.

`code/02_make_figure1.R`:

- Generates a histogram of the age at the first heart attack using ggplot2.
- Saves the plot as figure1.rds in the output/ folder.

`code/03_render_report.R`:

- Compiles the R Markdown file maria_report.Rmd into a final HTML report.

## How to Generate the Final Report

### Using Make (Simplest Approach)

1. Clone this repository:

```
git clone https://github.com/MariaAlvarez95/final_project_maria.git
cd final_project_maria
```

2. Generate the report:

```
make
```

3. The final report will be available as `maria_report.html`.

### Using R Packages

If you prefer to manage the package dependencies yourself:
```
make install     # Install required R packages using renv
```

## Docker Support 

To ensure reproducibility across different systems, we provide a Docker image that contains the exact environment needed to run this analysis.

### Run with Docker (Step-by-Step)

1. Install Docker Desktop for your operating system from [docker.com](https://www.docker.com/products/docker-desktop/)

2. Create necessary directories:
```bash
mkdir -p output report
```

3. Pull and run the Docker image:

```bash
# For Intel/AMD processors (Windows, Linux, older Macs):
docker pull mariaalvarez95/final:latest
docker run --rm \
  -v "$(pwd)/output:/final/output" \
  -v "$(pwd)/report:/final/report" \
  mariaalvarez95/final:latest

# For Apple Silicon Macs (M1/M2/M3):
docker pull --platform linux/amd64 mariaalvarez95/final:latest
docker run --platform linux/amd64 --rm \
  -v "$(pwd)/output:/final/output" \
  -v "$(pwd)/report:/final/report" \
  mariaalvarez95/final:latest
```

4. The report will be generated and available in the `report` directory.

## Windows-Specific Instructions

If you're using Windows, replace `$(pwd)` with:
- `%cd%` in Command Prompt
- `${PWD}` in PowerShell

Example in Command Prompt:
```
mkdir output report
docker pull mariaalvarez95/final:latest
docker run --rm -v "%cd%/output:/final/output" -v "%cd%/report:/final/report" mariaalvarez95/final:latest
```

## Dataset Description

The dataset, `male_w_heartattack_analysis.csv`, is sourced from the Panel Study of Income Dynamics (PSID). It includes variables such as:

- Age at the first heart attack.
- Income and family income level.
- Marital status.
- Health conditions like hypertension and diabetes.

## Report Overview
The final report includes:
- Descriptive Statistics: Summarized tables of key demographic and health variables.
- Visualization: Histogram of the distribution of ages at the first heart attack.
- Findings: Insights into the relationships between sociodemographic and health factors with heart attacks.