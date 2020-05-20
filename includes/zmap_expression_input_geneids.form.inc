<?php

/**
 * Implements hook_form.
 */
function zmap_expression_input_geneids_form($form, &$form_state, $var)
{
    if ($var == 'pop') {
        $description = '<p style="font-weight:bold;">Search for expression pattern of given genes in different samples.</p>';
    } elseif ($var == 'ref') {
        $description = '<p style="font-weight:bold;">Search for expression pattern of given genes in different tissues.</p>';
    }
    $form['descriptions'] = array(
        '#type' => 'item',
        '#markup' => t($description),
    );

    $form['etype'] = array(
        '#type' => 'hidden',
        '#value' => $var,
    );

    $form['example_btn'] = array(
        '#type' => 'button',
        '#value' => 'Try an Example',
        '#attributes' => array('class' => array('example_btn_'.$var)),
        '#executes_submit_callback' => false,
    );

    $form['geneids'] = array(
        '#type' => 'textarea',
        '#attributes' => array(
            'placeholder' => t('Enter Gene IDs here, separate genes with comma or new line. Limited to 50 entries for better presentation.'),
        ),
    );

    if ($var == 'pop') {
        //population select
        $form['population'] = array(
            '#type' => 'select',
            '#title' => 'Select a population',
            '#options' => array(
                'Mays' => 'Mays',
                //'Teosinte' => 'Teosinte',
            ),
            '#default_value' => !empty($_SESSION['zmap_expression']['form']['population']) ? $_SESSION['zmap_expression']['form']['population'] : 'mays',
        );
        //tissue select
        $form['tissue'] = array(
            '#type' => 'select',
            '#title' => 'Select a tissue',
            '#options' => array(
                'Kernel' => 'Kernel',
            ),
            '#default_value' => !empty($_SESSION['zmap_expression']['form']['population']) ? $_SESSION['zmap_expression']['form']['population'] : 'mays',
        );
    }

    $table = 'zmap_expression_'.$var.'_sample';
    $first_category = array('All' => 'All');
    $categories = zmap_expression_retrive_categories($table);
    $categories = array_merge($first_category, $categories);

    if ($var == 'pop') {
        $_lab = 'Samples';
    } else {
        $_lab = 'Tissues';
    }
    $form['SAMPLES'] = array(
        '#type' => 'fieldset',
        '#title' => t("Select $_lab"),
        '#collapsible' => false,
        '#collapsed' => false,
    );

    $form['SAMPLES']['SELECT_CATEGORY'] = array(
        '#type' => 'select',
        '#title' => 'Select a category:',
        '#options' => $categories,
        '#default_value' => 'All',
    );

    $form['SAMPLES']['SELECT_SAMPLES'] = array(
        '#type' => 'fieldset',
        '#title' => t('Select Samples'),
        '#prefix' => '<div id="sampleMenu" class="sampleMenu_'.$var.'">',
        '#suffix' => '</div>',
        '#required' => true,
        '#collapsible' => false,
        '#collapsed' => false,
        '#required' => true,
    );

    $selected_category = 'All';
    $samples = zmap_expression_retrive_samples($table, $selected_category);
    $selected_category = array_keys($samples);
    foreach ($selected_category as $category) {
        $form['SAMPLES']['SELECT_SAMPLES'][$category] = array(
            '#title' => $category,
            '#type' => 'checkboxes',
            '#options' => $samples[$category],
        );
    }

    $form['submit'] = array(
        '#type' => 'submit',
        '#attributes' => array('id' => 'batchSubmit'),
        '#value' => 'Search',
    );

    $form['#validate'][] = 'zmap_expression_input_geneids_form_validate';
    $form['#submit'][] = 'zmap_expression_input_geneids_form_submit';

    return $form;
}

function zmap_expression_input_geneids_form_submit($form, $form_state)
{
    //cache submit values
    $_SESSION['zmap_expression']['form']['geneids'] = $form_state['values']['geneids'];
    $_SESSION['zmap_expression']['form']['population'] = @$form_state['values']['population'];

    $etype = $form_state['values']['etype'];
    $geneids = $form_state['values']['geneids'];
    $selected_category = $form_state['values']['SELECT_CATEGORY'];
    $samples = [];
    if ($selected_category == 'All') {
        $table = 'zmap_expression_'.$form_state['values']['etype'].'_sample';
        $categories = zmap_expression_retrive_categories($table);
        foreach ($categories as $category) {
            $samples = array_merge($samples, array_filter($form_state['values'][$category]));
        }
    } else {
        $samples = array_filter($form_state['values'][$selected_category]);
    }
    $samples = implode(',', $samples);
    drupal_goto('zmap_expression/search/result/etype/'.$etype.'/geneids/'.$geneids.'/samples/'.$samples);
}

/**
 * Implements hook_form_validate.
 */
function zmap_expression_input_geneids_form_validate($form, &$form_state)
{
    if (empty($form_state['values']['geneids'])) {
        form_set_error('geneids', t('At least 1 gene should be provided.'));
    }

    $selected_category = $form_state['values']['SELECT_CATEGORY'];
    $samples = [];
    if ($selected_category == 'All') {
        $table = 'zmap_expression_'.$form_state['values']['etype'].'_sample';
        $categories = zmap_expression_retrive_categories($table);
        foreach ($categories as $category) {
            $samples = array_merge($samples, array_filter($form_state['values'][$category]));
        }
    } else {
        $samples = array_filter($form_state['values'][$selected_category]);
    }
    if (count($samples) == 0) {
        form_set_error('SELECT_SAMPLES', t('At least 1 sample should be selected.'));
    }

    //format geneids input
    $form_state['values']['geneids'] = str_replace(array(' ', "\t", "\r", "\n", "\r\n"), ',', $form_state['values']['geneids']);
    $form_state['values']['geneids'] = htmlspecialchars($form_state['values']['geneids']);
}
