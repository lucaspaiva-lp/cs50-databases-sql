-- Criação do Banco e Seleção do Banco
CREATE DATABASE IF NOT EXISTS `linkedin`;
USE `linkedin`;

-- Apagar as tabelas existentes na ordem inversa de dependência (filhos primeiro, pais depois)
DROP TABLE IF EXISTS `company_connections`;
DROP TABLE IF EXISTS `school_connections`;
DROP TABLE IF EXISTS `user_connections`;
DROP TABLE IF EXISTS `companies`;
DROP TABLE IF EXISTS `schools`;
DROP TABLE IF EXISTS `users`;

-- 1. Tabela dos Usuários
CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

-- 2. Tabela de Escolas / Universidades
CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `founded_year` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

-- 3. Tabela de Empresas
CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

-- 4. Conexões entre Pessoas
CREATE TABLE `user_connections` (
    `user_a_id` INT UNSIGNED,
    `user_b_id` INT UNSIGNED,
    PRIMARY KEY (`user_a_id`, `user_b_id`),
    FOREIGN KEY (`user_a_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_b_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- 5. Conexões com Escolas
CREATE TABLE `school_connections` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`) ON DELETE CASCADE
);

-- 6. Conexões com Empresas 
CREATE TABLE `company_connections` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE CASCADE
);