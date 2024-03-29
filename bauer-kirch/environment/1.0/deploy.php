<?php
namespace Deployer;

require 'eap-recipe.php';

// add custom settings and tasks here, e.g.:
//   task('database:update-schema', function () { ... });
//   after('database:migrate', 'database:update-schema');

// add the following line if your project uses Symfony Messenger workers:
//   after('deploy:publish', 'workers:terminate');


// Hosts
host('prod.my-site.com')
    ->setLabels([
        'stage' => 'prod',
    ])
    ->setRemoteUser('www-data')
    ->setDeployPath('/srv/www/sites/my_site')
;

host('staging.my-site.com')
    ->setLabels([
        'stage' => 'staging',
    ])
    ->setRemoteUser('www-data')
    ->setDeployPath('/srv/www/sites/my_site')
;
