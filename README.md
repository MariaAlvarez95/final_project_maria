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

### Prerequisites
- Install Docker (optional, but recommended for reproducibility).
- Install R and the make utility if not using Docker.

### Steps

1. Clone this repository:

```
git clone https://github.com/MariaAlvarez95/final_project_maria.git
```
```
cd final_project_maria
```

2. Clean any previously generated outputs:
```
make clean
```

3. Generate the report:

```
make
```

4. The final report will be available in the `output/` directory as `maria_report.html`.


## Synchronizing Package Environment

To ensure reproducibility, synchronize the package environment:

```sh
make install
``` 
This command uses `renv` to install the exact package versions required for the project.

## Docker Instructions

### Building the Docker Image
To containerize the project:

```
make docker_build
```

### Running the Analysis in Docker
Generate the report using Docker:

```
make docker_run
```
This will mount the local `output/` and `report/` folders into the container and compile the report.

#### Pull the Image
To download the Docker image, run:
```
docker pull mariaalvarez95/final:latest
```
Run the Image
After pulling the image, you can run it to generate the report:
```
docker run --rm \
    -v $(pwd)/output:/final/output \
    -v $(pwd)/report:/final/report \
    mariaalvarez95/final:latest \
    make all
```
This command:

`-v $(pwd)/output:/final/output`: Mounts your local `output/` folder to the container's `/final/output` directory.

`-v $(pwd)/report:/final/report`: Mounts your local `report/` folder to the container's `/final/report` directory.

`make all`: Executes the analysis workflow inside the container.

Access the Generated Report
After running the container, the generated report (`maria_report.html`) will be available in your local `report/` directory.

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

