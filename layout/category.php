<div class="list-group mt-5 shadow">
	<h5 class="list-group-item bg-warning text-light">
		Categories
	</h5>
	<?php
	include "./presentation/categoryP.php";
	$cp = new CategoryPresentation();
	$cp->ShowAllCategories();
	?>
</div>