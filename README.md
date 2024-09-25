# Starter folder

## Overview

Toronto Shelter Research is a project studying the shelters located in the City of Toronto, which is funded by the government. The project is designed to investigate the availability and effectiveness of shelters in Toronto. It is built using Rstudio.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Toronto Data and downloaded in `scripts/01-download_data.R`.
-   `data/simulated_data` contains the simulated data that was constructed from `scripts/00-simulate_data.R`.
-   `data/analysis_data` contains the cleaned dataset that was constructed from `scripts/02-data_cleaning.R`.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the chat tools Chatgpt4. The abstract and introduction were written with the help ofthe chat tools Chatgpt4 and the entire chat history is available in inputs/llms/usage.txt.
