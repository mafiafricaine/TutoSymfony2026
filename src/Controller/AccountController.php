<?php

namespace App\Controller;

use App\Form\UserFormType;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

final class AccountController extends AbstractController
{
    #[Route('/account', name: 'app_account')]
    public function show(): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'You must login to see your account !');
            return $this->redirectToRoute('app_login');
        }
        return $this->render('account/show.html.twig');
    }

    #[Route('/account/edit', name: "app_account_edit")]
    public function edit(Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response{
        if (!$this->getUser()) {
            $this->addFlash('error', 'You must login to edit your account !');
            return $this->redirectToRoute('app_login');
        }
        $user=$this->getUser();
        $form = $this->createForm(UserFormType::class, $user);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em->flush();
            $this->addFlash('success', $translator->trans('Account successfuly updated !'));
            return $this->redirectToRoute('app_account');
        }
        return $this->render('account/edit.html.twig', [
            'user' => $user,
            'userForm' => $form->createView()
        ]);
    }
}
