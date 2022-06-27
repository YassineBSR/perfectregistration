<?php

namespace App\Controller;

use App\Form\EditNewsletterType;
use App\Form\EditProfileType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UsersController extends AbstractController
{
    #[Route('/users', name: 'app_users')]
    public function index(): Response
    {
        return $this->render('users/index.html.twig', [
            'controller_name' => 'UsersController',
        ]);
    }

    #[Route('/users/newsletter', name: 'app_users_newsletter')]
    public function shownewsletter(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(EditNewsletterType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('message', 'Mise a jour !');
            return $this->redirectToRoute('app_users');
        }

        return $this->render('users/newsletter.html.twig', [
            'registrationForm' => $form->createView(),
        
        ]);
    }

    #[Route('/users/edit', name: 'app_users_edit')]
    public function editProfile(Request $request, EntityManagerInterface $entityManager)
    {
        $user = $this->getUser();
        $form = $this->createForm(EditProfileType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('message', 'Mise a jour !');
            return $this->redirectToRoute('app_users');
        }

        return $this->render('users/edit.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }
    
}
