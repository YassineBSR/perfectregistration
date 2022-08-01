<?php

namespace App\Controller;

use App\Entity\Annonce;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\AnnonceType;
use App\Repository\AnnonceRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AnnoncesController extends AbstractController
{
    #[Route('/annonces', name: 'app_annonces')]
    public function index(AnnonceRepository $annonceRepo): Response
    {
        return $this->render('annonces/index.html.twig', [
            'annonces' => $annonceRepo->findAll(),
        ]);
    }


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

    #[Route('/annonces/{id}', name: 'app_annonces_show')]
    public function show(Annonce $annonce): Response
    {
        if (!$annonce) {
            return $this->redirectToRoute('app_home');
        }

        return $this->render('annonces/show.html.twig', [
            "annonces" => $annonce,
        ]);
    }
}
