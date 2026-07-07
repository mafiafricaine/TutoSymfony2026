<?php

namespace App\Controller;

use App\Entity\Recipe;
use App\Form\RecipeType;
use App\Repository\RecipeRepository;
// use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
// use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
// use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Contracts\Translation\TranslatorInterface;

final class RecipeController extends AbstractController
{
    #[Route(path: "/recette", name: "app_recipe_index")]
    public function index(RecipeRepository $repository,  TranslatorInterface $translator, Request $request): Response
    {
        if ($this->getUser()) {
            /**
            * @var User 
            */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash("info", $translator->trans("recipeController.index.emailNotVerified"));
            }
        }
        //va recuperer toutes les recettes (equivalent Select *)
        //en utilisant RecipeRepository
        //la pagination sans passer par repository
        // $data = $repository->findAll();
        // $recipes = $paginatorInterface->paginate(
        //     $data,
        //     $request->query->getInt('page',1),
        //     9
        // );

        //la pagination en passant par recipe repository
        $recipes = $repository->findRecipes($request->query->getInt('page',1));
        /*va recuperer toutes les recettes (equivalent Select *)
        //en utilisant RecipeRepository
        // $recipes = $em->getRepository(Recipe::class)->findAll();


        //retrouver toutes les recettes en fonction d'une durée maximum
        // $recipes = $repository->findRecipeDurationLowerThan(60);

        //comment créer une recette et l'envoyer en base de données 
        // $recipe = new Recipe;
        // // $recipe = new Recipe();
        // $recipe->setTitle('Bruschette aux Tomates')
        //     ->setSlug('bruschette-aux-tomates')
        //     ->setContent('
        //     Ingrédients :
        //     -pain blanc
        //     -tomates
        //     -huile d\'olive

        //     Préparation :
        //     Prenez une tranche de pain, prenez des tomates, coupez-les, mettez-les sur le pain, ajoutez de l\'huile d\olive.')
        //     ->setDuration(5)
        //     ->setCreatedAt(new DateTimeImmutable())
        //     ->setUpdatedAt(new DateTimeImmutable());
        // $em->persist($recipe); 
        // $em->flush(); 

        //Modifier une recette existante en prenant toutes les recettes dans un premier tant (findall)
        //Je modifie le nom de la 2eme recette
        // $recipes[1]->setTitle('Pondu (Saka Saka)');
        // $em->flush();

        //Suppression de la 5eme recette
        // $em->remove($recipes[4]);
        // $em->flush();
        */

        return $this->render('recipe/index.html.twig', [
            "recipes" => $recipes
        ]);
    }

    #[Route(path: "/recette/{slug}-{id}", name: "app_recipe_show", requirements: ['id' => '\d+', 'slug' => '[a-z0-9-]+'])]
    public function show(string $slug, int $id, RecipeRepository $repository): Response
    {
        // dd($request->attributes->get('slug') , $request->attributes->getInt('id'));
        // dd($slug, $id);
        // return new Response("Recette numéro ". $id . " : " .$slug);

        $recipe = $repository->find($id);
        if ($recipe->getSlug() !== $slug) {
            return $this->redirectToRoute('app_recipe_show', ['slug' => $recipe->getSlug(), 'id' => $recipe->getId()]);
        }
        return $this->render('recipe/show.html.twig', [
            "recipe" => $recipe
        ]);
    }

    #[Route(path: '/recette/{id}/edit', name: 'app_recipe_edit')]
    public function edit(Recipe $recipe, Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if ($this->getUser()) {
            /**
            * @var User 
            */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to edit Recipe !'));
                return $this->redirectToRoute('app_recipe_index');
            } elseif($recipe->getUser()->getEmail() !== $user->getEmail()){
                $this->addFlash('error', $translator->trans('You must be the user ').$recipe->getUser()->getEmail() . $translator->trans(' to edit this recipe') );
                return $this->redirectToRoute('app_recipe_index');
            }  
        } else {
            $this->addFlash('error', $translator->trans('You must login to edit Recipe !'));
            return $this->redirectToRoute('app_login');
        }

        // dd($recipe);
        //cette methode prend en premier paramètre le formulaire que l'on souhaite utiliser
        //en second paramètre elle prend les données
        $form = $this->createForm(RecipeType::class, $recipe);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', $translator->trans('The recipe was successfully modified !'));
            return $this->redirectToRoute('app_recipe_show', ['slug' => $recipe->getSlug(), 'id' => $recipe->getId()]);
        }
        return $this->render('recipe/edit.html.twig', [
            'recipe' => $recipe,
            'monForm' => $form
        ]);
    }

    #[Route(path: '/recette/create', name: 'app_recipe_create')]
    public function create(Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {        
        if ($this->getUser()) {
            /**
            * @var User 
            */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to create Recipe !'));
                return $this->redirectToRoute('app_recipe_index');
            }   
        } else {
            $this->addFlash('error', $translator->trans('You must login to create Recipe !'));
            return $this->redirectToRoute('app_login');
        }
        $recipe = new Recipe;
        $form = $this->createForm(RecipeType::class, $recipe);
        $form->handleRequest($request);
        // dd($this->getUser());
        if ($form->isSubmitted() && $form->isValid()) {
            $recipe->setUser($this->getUser());
            $em->persist($recipe);
            $em->flush();
            $this->addFlash('success', $translator->trans('The recipe ') . $recipe->getTitle() . $translator->trans(' was successfully created'));
            return $this->redirectToRoute('app_recipe_index');
        }
        return $this->render('recipe/create.html.twig', [
            'monForm2' => $form
        ]);
    }

    #[Route(path: '/recette/{id}/delete', name: 'app_recipe_delete')]
    public function delete(Recipe $recipe, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if ($this->getUser()) {
            /**
            * @var User 
            */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to delete Recipe !'));
                return $this->redirectToRoute('app_recipe_index');
            } elseif($recipe->getUser()->getEmail() !== $user->getEmail()){
                $this->addFlash('error', $translator->trans('You must be the user ').$recipe->getUser()->getEmail() . $translator->trans(' to delete this recipe' ));
                return $this->redirectToRoute('app_recipe_index'); 
            } 
        } else {
            $this->addFlash('error', $translator->trans('You must login to delete Recipe !'));
            return $this->redirectToRoute('app_login');
        }
        $titre = $recipe->getTitle();
        $em->remove($recipe);
        $em->flush();
        $this->addFlash('info', $translator->trans('The recipe ') . $titre . $translator->trans(' was successfully deleted !'));
        return $this->redirectToRoute('app_recipe_index');
    }



    //retourner un json
    // #[Route(path : "/recette2/{slug}-{id}", name : "app_recipe_show2", requirements: ['id'=> '\d+', 'slug' => '[a-z0-9-]+'])]
    // public function show2(string $slug, int $id): JsonResponse{
    //     // return new JsonResponse([
    //     //     'id' => $id,
    //     //     'slug' => $slug
    //     // ]);
    //     return $this->json([
    //         'id' => $id,
    //         'slug' => $slug
    //     ]);
    // }
}
