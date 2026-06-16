#!/bin/bash

# Run the merge rules
snakemake --use-conda --cores all --resources mem_mb=250000\
    --snakefile "../brieflow/workflow/Snakefile" \
    --configfile "config/config.yml" \
    --rerun-triggers mtime \
    --until all_merge
