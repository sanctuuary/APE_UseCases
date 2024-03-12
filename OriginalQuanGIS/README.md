# GIS Question Answering Data Repository

Welcome to the GIS Question Answering case study repository. This study evaluates the efficiency of Automated Pipeline Explorer, comparing the original `APE v1` and its extension, APE with Extended Semantic Temporal Logic support (`APE v2`), in synthesizing workflows for answering specific questions about the liveability in Amsterdam's PC4 areas.

## Overview

This repository contains data and configurations for a comparative experiment between SLTL-based (`APE v1`) and SLTL<sup>x</sup>-based (`APE v2`) approaches. It focuses on the quality of the solutions and the computational time required to synthesize workflows that address various aspects of Amsterdam's urban environment.

## Experiment Description

The case study comprises five research questions related to geographical and demographic characteristics within Amsterdam. The experiment demonstrates the computational efficiency of `APE v2` in generating optimal workflow solutions by reducing redundancies, compared to `APE v1`'s suboptimal solutions.

## Repository Structure

Folders `Q1` to `Q5` contain configurations and datasets for running both `APE v1` and `APE v2` for each research question:

- `Q1`: Number of sports facilities in each PC4 area.
- `Q2`: Proportion of elderly people in each PC4 area.
- `Q3`: Accessibility of parks in each PC4 area.
- `Q4`: Amount of noise pollution in each PC4 area.
- `Q5`: Average temperature within each PC4 area.

## Getting Started

### Prerequisites

- Java 1.8 or higher installed on your system.

### Setup

Clone this repository to your local machine to get started with the experiments:

```bash
git clone git@github.com:sanctuuary/APE_UseCases.git
cd APE_UseCases
```

### Running the Experiments

To run an experiment for a specific question using APE v2.3.0, execute:

```bash
java -jar APE-2.3.0-executable.jar OriginalQuanGIS/Q1/config.json
```

For running APE v1.1.7 for the same question, use:

```bash
java -jar APE-1.1.7-executable.jar OriginalQuanGIS/Q1/config_v1.json
```

Replace `Q1` with the appropriate question directory (`Q1`, `Q2`, `Q3`, `Q4`, `Q5`) for other experiments.

## Results

The solutions will be generated in the respective directories:

- For APE v2: `APE_UseCases/OriginalQuanGIS/Q1/v2`
- For APE v1: `APE_UseCases/OriginalQuanGIS/Q1/v1`

Follow similar steps for other questions by navigating to the corresponding question directory and running the appropriate command.

## Acknowledgments

A special thank you to everyone who contributed to the APE project and this case study. Your efforts are invaluable to the GIS and workflow synthesis communities.
