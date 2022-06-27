<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class EditProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('lastname',TextType::class, [
            'constraints' => [new Length([
             'min' => 2,
             'minMessage' => 'Votre nom doit comporter au moins {{ limit }} caractères',
             ])
            ],
        ])
        ->add('firstname',TextType::class, [
            'constraints' => [new Length([
             'min' => 2,
             'minMessage' => 'Votre prenom doit comporter au moins {{ limit }} caractères',
             ])
            ],
        ])
        ->add('phone')
        ->add('birthdate', DateType::class, [
            'attr' => ['class' => 'form-control js-datepicker'],
            'widget' => 'single_text',
         
        ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
