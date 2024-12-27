<?php

session_start();

require_once __DIR__ . '/../Models/ProductModel.php';
require_once __DIR__ . '/../Models/UserModel.php';
require_once __DIR__ . '/../utils/Database.php';

use Models\ProductModel;
use Models\UserModel;

class MainController
{
    private ProductModel $productModel;
    private UserModel $userModel;

    public function __construct()
    {
        $pdo = \Database::getPDO();
        $this->productModel = new ProductModel($pdo);
        $this->userModel = new UserModel($pdo);

        if (empty($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
    }

    public function home()
    {
        $this->render('home');
    }

    public function about()
    {
        $this->render('about');
    }

    public function Catalogue()
    {
        $products = $this->productModel->fetchAllProducts();
        $this->render('Catalogue', ['products' => $products]);
    }

    public function Inscription()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
                die('Invalid CSRF token');
            }

            $name = $_POST['name'] ?? null;
            $email = $_POST['email'] ?? null;
            $password = $_POST['password'] ?? null;

            if ($name && $email && $password) {
                $this->userModel->addUser($name, $email, $password);
                header('Location: /Connexion');
                exit;
            } else {
                $error = "Tous les champs sont obligatoires.";
                $this->render('Inscription', ['error' => $error]);
            }
        } else {
            $this->render('Inscription');
        }
    }

    public function Connexion()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
                die('Invalid CSRF token');
            }

            $email = $_POST['email'] ?? null;
            $password = $_POST['password'] ?? null;

            $user = $this->userModel->findUserByEmail($email);

            if ($user && password_verify($password, $user['password'])) {
                $_SESSION['user'] = $user;
                header('Location: /Catalogue');
                exit;
            } else {
                $error = "Identifiants incorrects.";
                $this->render('Connexion', ['error' => $error]);
                return;
            }
        }

        $this->render('Connexion');
    }

    public function Panier()
    {
        $this->render('Panier');
    }

    public function notFound()
    {
        http_response_code(404);
        echo "404 - Page Not Found!";
    }

    private function render(string $view, array $data = [])
    {
        extract($data);
        $viewFile = __DIR__ . '/../views/' . $view . '.php';
        if (file_exists($viewFile)) {
            require_once $viewFile;
            require_once __DIR__ . '/../views/partials/footer.php';
        } else {
            echo "View not found: $view";
        }
    }
}
