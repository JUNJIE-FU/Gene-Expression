<?php

function zmap_expression_retrive_categories($table = '')
{
    if ($table != '') {
        //db_set_active('expression');
        $res = db_select($table, $table)->fields($table, array('class'))->distinct('class')->execute()->fetchAll(PDO::FETCH_ASSOC);
        $data = [];
        if (!empty($res)) {
            foreach ($res as $category) {
                foreach ($category as $class) {
                    $_class = trim($class);
                    $data[$_class] = $_class;
                }
            }
        }

        return $data;
    }
}

function zmap_expression_retrive_samples($table = '', $category = '')
{
    if ($table != '' && $category != '') {
        //db_set_active('expression');
        if ($category == 'All') {
            $res = db_select($table, $table)->fields($table)->distinct()->orderBy('sample', 'asc')->execute()->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $res = db_select($table, $table)->fields($table)->condition('class', $category, '=')->distinct()->orderBy('sample', 'asc')->execute()->fetchAll(PDO::FETCH_ASSOC);
        }
        $data = [];
        if (!empty($res)) {
            foreach ($res as $v) {
                $_class = trim($v['class']);
                $_sample = trim($v['sample']);
                $data[$_class]["$_sample"] = $_sample;
            }
        }

        return $data;
    }
}

function zmap_expression_api_retrive_samples($type = '')
{
    if ($type != '') {
        //db_set_active('expression');
        $table = 'zmap_expression_'.$type.'_sample';
        $res = db_select($table, $table)->fields($table)->distinct()->execute()->fetchAll(PDO::FETCH_ASSOC);
        $data = [];
        if (!empty($res)) {
            foreach ($res as $k => $v) {
                $data[] = array(
                    'colorHex' => substr(trim($v['hex']), 1),
                    'colorRgb' => trim($v['rgb']),
                    'tissueSite' => trim($v['class']),
                    'tissueSiteDetail' => trim($v['sample']),
                    'tissueSiteDetailAbbr' => trim($v['sample']),
                    'tissueSiteDetailId' => trim($v['sample']),
                    'uberonId' => trim($v['sample']),
                );
            }
        }
        $result['tissueSiteDetail'] = $data;
        drupal_json_output($result);
    }
}

function zmap_expression_api_retrive_geneids($geneids = '')
{
    if ($geneids != '') {
        $genes = explode(',', $geneids);
        foreach ($genes as $k => $v) {
            $data[] = ['gencodeId' => trim($v), 'geneSymbol' => trim($v)];
        }
        $res['gene'] = $data;

        drupal_json_output($res);
    }
}

function zmap_expression_api_retrive_media_data($type, $samples, $geneids)
{
    if ($type == 'pop') {
        return pop_exp_media_data($samples, $geneids);
    } elseif ($type == 'ref') {
        return ref_exp_media_data($samples, $geneids);
    }
}

function pop_exp_media_data($samples, $geneids)
{
    //db_set_active('expression');
    $samples = 'GeneID,'.$samples;
    $samples = explode(',', $samples);
    $genes = explode(',', $geneids);
    $fields = '';
    foreach ($samples as $k => $v) {
        $fields .= '"'.$v.'"'.',';
    }
    $genev = '';
    foreach ($genes as $k => $v) {
        $genev .= "'".$v."'".',';
    }
    $genev = trim($genev, ',');
    $fields = trim($fields, ',');
    $sql = "select $fields from zmap_expression_pop_expression where ".'"GeneID" in ('.$genev.')';
    $res = db_query($sql)->fetchAll(PDO::FETCH_ASSOC);

    $header = implode("\t", $samples);
    $header .= "\r\n";
    $rscript_res = rscript($samples, $header, $res);
    foreach ($rscript_res['res'] as $k => $v) {
        foreach ($v as $k1 => $v1) {
            if ($k1 == 'GeneID') {
                continue;
            }
            $data[] = ['datasetId' => 'mays', 'gencodeId' => $v['GeneID'], 'geneSymbol' => $v['GeneID'], 'median' => $v1, 'tissueSiteDetailId' => $k1, 'unit' => 'FPKM'];
        }
    }
    $expression_data = ['clusters' => ['gene' => $rscript_res['cluster_gene'], 'tissue' => $rscript_res['cluster_sample']], 'medianGeneExpression' => $data, 'tsv' => $rscript_res['tsvfile']];

    drupal_json_output($expression_data);
}

function ref_exp_media_data($samples, $geneids)
{
    //db_set_active('expression');
    $table = 'zmap_expression_ref_expression_';
    $samples = explode(',', $samples);
    $genes = explode(',', $geneids);
    $b73_fields = $sk_fields = $hzs_fields = $mo17_fields = '';
    $b73_header = $sk_header = $hzs_header = $mo17_header = [];
    $table1 = $table2 = $table3 = $table4 = '';
    foreach ($samples as $k => $v) {
        if (stripos($v, 'B73') !== false) {
            $table1 = $table.'b73';
            $b73_header[] = $v;
            $b73_fields .= '"'.$v.'"'.',';
        } elseif (stripos($v, 'SK') !== false) {
            $table2 = $table.'sk';
            $sk_header[] = $v;
            $sk_fields .= '"'.$v.'"'.',';
        } elseif (stripos($v, 'HZS') !== false) {
	    $table3 = $table.'hzs';
	    $hzs_header[] = $v;
	    $hzs_fields .= '"'.$v.'"'.',';
	} elseif (stripos($v, 'Mo17') !== false) {
	    $table4 = $table.'mo17';
	    $mo17_header[] = $v;
	    $mo17_fields .= '"'.$v.'"'.',';
	}
    }
    $b73_fields = '"GeneID",'.$b73_fields;
    $sk_fields = '"GeneID",'.$sk_fields;
    $hzs_fields = '"GeneID",'.$hzs_fields;
    $mo17_fields = '"GeneID",'.$mo17_fields;
    array_unshift($b73_header, 'GeneID');
    array_unshift($sk_header, 'GeneID');
    array_unshift($hzs_header, 'GeneID');
    array_unshift($mo17_header, 'GeneID');
    $genev = '';
    foreach ($genes as $k => $v) {
        $genev .= "'".$v."'".',';
    }
    $genev = trim($genev, ',');
    $b73_fields = trim($b73_fields, ',');
    $sk_fields = trim($sk_fields, ',');
    $hzs_fields = trim($hzs_fields, ',');
    $mo17_fields = trim($mo17_fields, ',');
    $res = $res1 = $res2 = $res3 = $res4 = array();

    if ($table1) {
        $sql = "select $b73_fields from $table1 where ".'"GeneID" in ('.$genev.')';
        $res1 = db_query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }
    if ($table2) {
        $sql = "select $sk_fields from $table2 where ".'"GeneID" in ('.$genev.')';
        $res2 = db_query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }
    if ($table3) {
        $sql = "select $hzs_fields from $table3 where ".'"GeneID" in ('.$genev.')';
        $res3 = db_query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }
    if ($table4) {
        $sql = "select $mo17_fields from $table4 where ".'"GeneID" in ('.$genev.')';
        $res4 = db_query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    $res = array_merge($res1, $res2, $res3, $res4);
	/*
    if ($table1) {
        $samples = $b73_header;
    }
    if ($table2) {
        $samples = $sk_header;
    }
    if ($table3) {
        $samples = $hzs_header;
    }
    if ($table4) {
        $samples = $mo17_header;
    }
    if ($table1 && $table2) {
        $samples = array_unique(array_merge($b73_header, $sk_header));
    }
      */
    $samples = array_unique(array_merge($b73_header, $sk_header, $hzs_header, $mo17_header));
    $header = implode("\t", $samples);
    $header .= "\r\n";
    $rscript_res = rscript($samples, $header, $res);
    $data = [];
    foreach ($rscript_res['res'] as $k => $v) {
        foreach ($v as $k1 => $v1) {
            if ($k1 == 'GeneID') {
                continue;
            }
            $data[] = ['datasetId' => 'mays', 'gencodeId' => $v['GeneID'], 'geneSymbol' => $v['GeneID'], 'median' => $v1, 'tissueSiteDetailId' => $k1, 'unit' => 'FPKM'];
        }
    }
    $expression_data = ['clusters' => ['gene' => $rscript_res['cluster_gene'], 'tissue' => $rscript_res['cluster_sample']], 'medianGeneExpression' => $data, 'tsv' => $rscript_res['tsvfile']];

    drupal_json_output($expression_data);
}

function rscript($samples, $header, $res)
{
    $files_dir = DRUPAL_ROOT.'/'.variable_get('file_public_path', conf_path().'/files');
    $module_path = drupal_get_path('module', 'zmap_expression');
    $search_result_path = $files_dir.'/zmap_expression_search_result';
    if (!is_dir($search_result_path)) {
        mkdir($search_result_path);
    }
    $filename = 'expression_'.time().'.tsv';
    $path = "$search_result_path/$filename";
    file_put_contents($path, $header);
    $_arr = [];
    foreach ($res as $k => $v) {
        $v = array_map('trim', $v);
        foreach ($samples as $k1) {
            if (!isset($v[$k1])) {
                $v[$k1] = 0;
            }
        }
        $_arr[] = $v;
        $line = implode("\t", $v);
        $line .= "\r\n";
        file_put_contents($path, $line, FILE_APPEND);
    }
    if (file_exists($path)) {
        $command = 'Rscript '.$module_path."/includes/get_nwk.R $path";
    }
    system($command);
    $cluster_gene = trim(file_get_contents($path.'.gene.nwk'), "\n");
    $cluster_sample = trim(file_get_contents($path.'.sample.nwk'), "\n");

    return array(
            'cluster_gene' => $cluster_gene,
            'cluster_sample' => $cluster_sample,
            'res' => $_arr,
            'tsvfile' => $filename,
    );
}
