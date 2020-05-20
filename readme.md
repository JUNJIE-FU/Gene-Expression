# ZEAMAP Gene Expression

Tripal module for visualization of gene expression patterns in ZEAMAP

View a demo here: [**DEMO**](http://www.zeamap.com/zmap_expression/search/result/etype/ref/geneids/Zm00015a000003%2C%2CZm00015a000005%2C%2CZm00015a000008%2C%2CZm00015a000009%2C%2CZm00015a000011%2C%2CZm00015a000012%2C%2CZm00015a000021%2C%2CZm00015a000023/samples/SK_15_DAP_Kernel%2CSK_Immature_Ear%2CSK_Internode%2CSK_Leaf%2CSK_Mature_pollen%2CSK_Primary_root%2CSK_SAM%2CSK_Silk%2CSK_Tassel)

## Platform

- Drupal 7.x
- Tripal 7.x-3.x

## Prerequisite

- [R](https://www.r-project.org/)
- [R/ape](http://ape-package.ird.fr/)

## Installation and Usage

- Make sure R (version 3.2.3 was used in ZEAMAP) and R package ape  were correctly installed.
- Download this repository, switch to drupal environment, and lunch this module with
    `drush en -y zmap_expression`

**NOTE**

This module would generate temporary gene expression cluster files which were placed in drupal public directory ( sites/default/files/zmap_expression_search_result ). An additional timed task (e.g. crontab) to clear these temporary files would be recommended.
