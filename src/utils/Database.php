<?php

class Database
{

    private $dbh;
    private static $_instance;
    private function __construct()
    {
        try {
            $this->dbh = new PDO(
                "mysql:host=localhost;dbname=ecom;charset=utf8",
                "root",
                "root"
            );
        } catch (\Exception $exception) {
            echo 'Erreur<br>';
            echo $exception->getMessage() . '<br>';
            echo '<pre>';
            echo $exception->getTraceAsString();
            echo '</pre>';
            exit;
        }
    }

    public static function getPDO()
    {
        if (empty(self::$_instance)) {
            self::$_instance = new Database();
        }
        return self::$_instance->dbh;
    }
}
