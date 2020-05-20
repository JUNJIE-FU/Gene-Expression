# zmap expression instruction
zmap expression drupal module is used for display form and heatmap for zea mays expression data
## Installation
Prerequisites:
-   R(r-base)
-   ape(r-cran-ape)
### install R and ape (ubuntu 16.04)
    `apt install -y r-base r-cran-ape`
### install and enable zmap expression module
use drush command to install and enable this module. e.g. `drush en -y zmap_expression`
after enable this module, you should create tables in database according to 'includes/zmap_expression.sql' file and import zea mays expression data use sql command manual.
## tips
use timed task (e.g. crontab) to clear expression cluster temporary files which placed in drupal public directory (sites/default/files/zmap_expression_search_result) in time. e.g.
`*/10 * * * * cd /var/www/html/sites/default/files/zmap_expression_search_result && rm expression*`
