<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;


class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
    
        yield TextField::new('Email');
        yield TextField::new('Lastname');
        yield TextField::new('Firstname');
        yield BooleanField::new('newsletter');
        yield BooleanField::new('emailing');
        yield TextField::new('phone')->hideOnIndex();
        yield TextField::new('genre')->hideOnIndex();
        yield DateField::new('birthdate')->hideOnIndex();
    
    }
    
}
