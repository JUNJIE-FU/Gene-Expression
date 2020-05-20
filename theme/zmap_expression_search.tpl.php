<?php

$input_geneids_form = drupal_get_form('zmap_expression_input_geneids_form', $type);
$html = '<div class="input_geneids_form">'.drupal_render($input_geneids_form).'</div>';
echo $html;
