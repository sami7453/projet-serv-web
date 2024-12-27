<?php

require_once __DIR__ . '/../controllers/MainController.php';

$router = new AltoRouter();

// Calcul automatique de la base path (en incluant /public)
$basePath = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/');
$router->setBasePath($basePath);

// Routes
$router->map('GET', '/', 'MainController#home', 'home');
$router->map('GET', '/about', 'MainController#about', 'about');
$router->map('GET', '/Inscription', 'MainController#Inscription', 'Inscription');
$router->map('POST', '/Inscription', 'MainController#Inscription', 'Inscription_POST');
$router->map('GET', '/Connexion', 'MainController#Connexion', 'Connexion');
$router->map('POST', '/Connexion', 'MainController#Connexion', 'Connexion_POST');
$router->map('GET', '/Catalogue', 'MainController#Catalogue', 'Catalogue');
$router->map('GET', '/Panier', 'MainController#Panier', 'Panier');

// Retourne l'objet router
return $router;
