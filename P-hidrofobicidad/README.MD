# SynBioScan: Automated Thermodynamic Profiling and Target Prediction

**SynBioScan** is an automated pipeline built in R, designed for structural bioinformatics and synthetic biology applications. This tool processes raw protein sequences, calculates their thermodynamic stability based on the Kyte-Doolittle hydrophobicity scale, and automatically predicts optimal coordinates for genetic editing (such as tag insertion or mutational scanning).

Originally developed and validated using the **SIRT1 enzyme** as a model, this tool evolves protein analysis from purely visual 3D inspection to a robust, data-driven decision-making process.

## Key Features:

* **Automated Quality Control (QC):** Sanitizes input sequences and quantifies biological noise (e.g., unknown residues 'X') prior to computation, preventing execution errors.
* **Parametric Sliding Window:** Implements a customizable moving average filter to smooth local fluctuations and reveal large-scale folding trends (hydrophobic core vs. hydrophilic surface loops).
* **Predictive Target Finder:** Algorithmic ranking of the resulting data matrix to extract and report the exact coordinates of the most hydrophilic domains, identifying the safest zones for synthetic interventions.
* **Gradient Visualization:** Generates a continuous 2D profile using `ggplot2` (blue-to-red gradient), providing an immediate visual audit of the molecule's thermodynamic topology.

## Tools Used:

* **Language:** R
* **Libraries:** `ggplot2` (Advanced data visualization), `zoo` (Vectorized sliding window calculations)
* **Core Logic:** Base R functions (`gsub`, `strsplit`, `for` loops, *Data Frames*) for efficient string processing with minimal dependencies.
