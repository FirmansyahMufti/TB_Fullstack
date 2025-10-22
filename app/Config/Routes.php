<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('api/orders/(:num)', 'Api\OrderController::show/$1');
$routes->get('api/sales/summary', 'Api\SalesController::summary');
