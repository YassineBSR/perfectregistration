<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220713120341 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_tokens (user_id INT NOT NULL, tokens_id INT NOT NULL, INDEX IDX_CF080AB3A76ED395 (user_id), INDEX IDX_CF080AB3558D68EA (tokens_id), PRIMARY KEY(user_id, tokens_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_tokens ADD CONSTRAINT FK_CF080AB3A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_tokens ADD CONSTRAINT FK_CF080AB3558D68EA FOREIGN KEY (tokens_id) REFERENCES tokens (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE user_tokens');
    }
}
