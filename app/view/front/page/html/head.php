	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title><?= $this->getTitle() ?></title>

		<meta name="description" content="<?= $this->getDescription() ?>">
		<meta name="keyword" content="<?= $this->getKeyword() ?>" />
		<meta name="author" content="<?= $this->getAuthor() ?>">
		<meta name="robots" content="<?= $this->getRobots() ?>" />


		<!-- Stylesheets -->
		<style>
			.btn {
				margin-bottom: 1em !important;
			}
		</style>
		<!-- END Stylesheets -->

		<?php $this->getAdditionalBefore() ?>
		<?php $this->getAdditional() ?>
		<?php $this->getAdditionalAfter() ?>

	</head>