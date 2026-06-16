#!/bin/bash

# Run only the preprocess rules, set appropiate RAM depending on machine config
snakemake --use-conda --cores all --resources gpu=0 mem_mb=250000\
    --snakefile "../brieflow/workflow/Snakefile" \
    --configfile "config/config.yml" \
    --rerun-triggers mtime \
    --until all_preprocess


# if splitting by GPU and non-gpu steps
# this run run everything up until segment


# snakemake --use-conda --cores all --resources gpu=0 mem_mb=250000\
#     --snakefile "../brieflow/workflow/Snakefile" \
#     --configfile "config/config.yml" \
#     --rerun-triggers mtime \
#     --until align_phenotype apply_ic_field_segmentation find_peaks max_filter

