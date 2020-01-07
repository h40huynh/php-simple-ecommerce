<nav class="navbar navbar-expand-lg shadow">
	<a class="navbar-brand" href="./">LOGO</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item ml-3 active">
				<a class="nav-link" href="./">Home</span></a>
			</li>
			<li class="nav-item ml-3">
				<a class="nav-link" href="#">About</a>
			</li>
			<li class="nav-item ml-3">
				<a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Contact</a>
			</li>
			<li class="nav-item ml-3">
				<a class="nav-link" href='./checkout.php' tabindex="-1" aria-disabled="true">
					<img src="./include/icon/shopping-cart.png" height="20" alt="">
					<sup>
						<span class="badge badge-warning text-light">
							<?php echo $_SESSION['total']; ?>
						</span>
					</sup>
				</a>
			</li>
			<li class="nav-item ml-3">
				<a class="nav-link" href='./checkout.php' tabindex="-1" aria-disabled="true">
					<img src="./include/icon/search.png" height="20" alt="">
				</a>
			</li>
		</ul>

	</div>
</nav>