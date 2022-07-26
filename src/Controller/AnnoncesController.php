<?php

namespace App\Controller;

use App\Entity\Annonce;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\AnnonceType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AnnoncesController extends AbstractController
{
    #[Route('/users/annonces/create', name: 'app_annonces_create')]
    public function create(Request $request, EntityManagerInterface $entityManagerInterface): Response
    {
        $annonce = new Annonce;
        $form = $this->createForm(AnnonceType::class, $annonce);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $user = $this->getUser();
            // dd($user);
            $annonce->setUser($user);
            $entityManagerInterface->persist($annonce);
            $entityManagerInterface->flush();

            return $this->redirectToRoute('app_home');
        }
        return $this->render('annonces/create.html.twig', [
            'formvue' => $form->createView(),
        ]);
    }
}
