# Metabolic Profiling Normalization and Visualization Pipeline

## Description:

This project consists of a **Proof of Concept (PoC)** pipeline developed in Python for the processing, cleaning, normalization, and visualization of targeted metabolomics data (LC-MS).

The tool is designed to ingest abundance matrices, filter the most representative metabolites, calculate relative row-wise abundance, and generate *Heatmaps* ready for biological interpretation.

*Transparency Note: To demonstrate the code architecture and graphical generation, this script extracts the real annotation dictionary (metabolite identification) from the public study **MTBLS13498** (MetaboLights) and injects a simulated abundance matrix for experimental groups (Control vs. Treatment). The pipeline is structured and ready to process real abundance matrices as soon as they are provided by the spectrometer.*

## Tech Stack:

* **Language:** Python 3
* **Data Manipulation:** `pandas`, `numpy`
* **Visualization:** `seaborn`, `matplotlib`
* **Environment:** Jupyter Notebook

## Script Features:

1. **Data Cleaning:** Null value imputation and index structuring using metabolic database identifiers.
2. **Filtering:** Automated selection of the Top 25 metabolites by mean abundance.
3. **Normalization:** Calculation of relative abundance iterating over the maximum value of each metabolite to enable visual cross-sample comparison.
4. **Visualization:** Generation of high-contrast heatmaps, exportable in high resolution (300 dpi).

## How to Run Locally:

1. Clone this repository.
2. Ensure the required libraries are installed (`pip install pandas numpy seaborn matplotlib`).
3. Execute the `.ipynb` file in your Jupyter environment or upload it to Google Colab.

* **Study:** [MTBLS13498: Metabolic profiling reveals CAD as a central metabolic signaling node](https://www.ebi.ac.uk/metabolights/editor/MTBLS13498/files)
* **Lead Authors:** Pinghui Feng, Chao Qin.

