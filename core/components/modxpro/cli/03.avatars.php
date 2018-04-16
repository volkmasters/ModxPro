<?php
/** @var $modx modX */
/** @var $pdo PDO */
require '_initialize.php';

/** @var App $App */
$App = $modx->getService('App');

$c = $modx->newQuery('modUser', ['Profile.photo:!=' => '']);
$c->innerJoin('modUserProfile', 'Profile');
$c->select('modUser.id, Profile.email, Profile.photo');
if ($c->prepare() && $c->stmt->execute()) {
    while ($row = $c->stmt->fetch(PDO::FETCH_ASSOC)) {
        $App->getAvatar($row, [25, 30, 40, 48, 64, 80]);
    }
    shell_exec('gulp avatars --gulpfile ~/www/Extras/ModxPro/_build/gulpfile.js');
}