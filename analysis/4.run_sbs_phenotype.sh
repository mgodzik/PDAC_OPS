#!/bin/bash

# Run the SBS/phenotype rules
# snakemake --use-conda --cores all --resources gpu_mem=96 --rerun-incomplete\
#     --snakefile "../brieflow/workflow/Snakefile" \
#     --configfile "config/config.yml" \
#     --rerun-triggers mtime \
#     --until all_sbs

 # with this VM configuration, we're VRAM-limited to 4 phenotype jobs
 # g2-standard-12 (12 vCPUs, 48 GB Memory), 1 x NVIDIA L4

# snakemake --use-conda --cores all --resources mem_mb=128000\
#     --snakefile "../brieflow/workflow/Snakefile" \
#     --configfile "config/config.yml" \
#     --printshellcmds --show-failed-logs \
#     --until all_phenotype

############################################################
############################################################
### updated jobs NG 20250810
# in order to tell snakemake to hold off job execution to prevent OOM provide it total mem_mb and gpa availability here, provide per job resource requirements in brieflow rules

# snakemake --use-conda --cores all --resources gpu=8 mem_mb=380000\
#     --snakefile "../brieflow/workflow/Snakefile" \
#     --configfile "config/config.yml" \
#     --printshellcmds --show-failed-logs \
#     --until all_sbs all_phenotype


# snakemake --use-conda --cores all --resources gpu=4 mem_mb=190000\
#   --snakefile "../brieflow/workflow/Snakefile" \
#   --configfile "config/config.yml" \
#   --printshellcmds --show-failed-logs \
#   --rerun-triggers mtime \
#   --until all_phenotype --dry-run

# STEP 1: this is for running everything up until segmentation (should run preprocess as well?)
# snakemake all_sbs all_phenotype \
#     --snakefile "../brieflow/workflow/Snakefile" \
#     --configfile "config/config.yml" \
#     --use-conda --cores all --rerun-triggers mtime \
#     --until align_phenotype apply_ic_field_segmentation apply_ic_field_sbs find_peaks max_filter

# STEP 2: segmentation
# Start a background loop that waits for snakemake to exit
# (
#   while pgrep -f snakemake >/dev/null; do
#     sleep 60    # check once per minute
#   done
#   sudo shutdown -h now
# ) &

snakemake --use-conda --cores all --resources gpu=8 mem_mb=380000\
    --snakefile "../brieflow/workflow/Snakefile" \
    --configfile "config/config.yml" \
    --rerun-triggers mtime \
    --printshellcmds --show-failed-logs \
    --until all_sbs all_phenotype
    
