<?php

namespace Models;

use PDO;

class UserModel
{
    private PDO $connection;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    public function addUser(string $name, string $email, string $password): bool
    {
        $sql = "INSERT INTO users (name, email, password) VALUES (:name, :email, :password)";
        $statement = $this->connection->prepare($sql);

        return $statement->execute([
            ':name' => $name,
            ':email' => $email,
            ':password' => password_hash($password, PASSWORD_DEFAULT),
        ]);
    }

    public function findUserByEmail(string $email): ?array
    {
        $sql = "SELECT * FROM users WHERE email = :email";
        $statement = $this->connection->prepare($sql);
        $statement->execute([':email' => $email]);

        $user = $statement->fetch(PDO::FETCH_ASSOC);
        return $user ?: null;
    }
}
