<style>
.btn-default {border-color: #4eb3d3; margin-right: 0;}
</style>
<div class="row">
	<div class="col-xs-12">
		<i id="spinner" class="fas fa-sync fa-spin" style="display:none;"></i>
	</div>
</div>
<?php

echo '<div id="heatmapRoot" style="overflow:auto;"></div>';
echo "<script>BatchGeneExpression.launch('heatmapRoot', '$etype', '$geneids', '$samples');</script>";
