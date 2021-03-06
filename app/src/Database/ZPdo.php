<?php

namespace Zipofar\Database;

use Psr\Container\ContainerInterface;

class ZPdo
{
    private $pdo;

    public function __construct(ContainerInterface $container)
    {
        $dsn = $_ENV['DB_TYPE'] . ":host=" . $_ENV['DB_HOST'] . ";dbname=" . $_ENV['DB_NAME'] . ";charset=utf8";
        $opt = [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        ];
        $this->pdo = new \PDO($dsn, $_ENV['DB_USER'], $_ENV['DB_PASSWORD'], $opt);
    }

    public function getPDO()
    {
        return $this->pdo;
    }
}
