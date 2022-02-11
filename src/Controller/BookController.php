<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Emprunt;
use App\Repository\BookRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/m/book')]
class BookController extends AbstractController
{
    #[Route('/', name: 'book_index')]
    public function index(BookRepository $bookRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $books = $bookRepository->findActiveBooks();
        $bookpag = $paginator->paginate(
            $books, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            5 /*limit per page*/
        );
        return $this->render('book/index.html.twig', [
            'books' => $bookpag,
        ]);
    }
    #[Route('/{id}/emprunter', name: 'book_emprunt')]
    public function emprunter(Book $book, EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser();
        $emprunt = new Emprunt();
        $emprunt->setUser($user)->setBook($book);
        $entityManager->persist($emprunt);
        $entityManager->flush();
        return $this->redirectToRoute('book_index');
    }

    #[Route('/{id}/retourner', name: 'book_retourner')]
    public function retourner(Emprunt $emprunt, EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($emprunt);
        $entityManager->flush();
        return $this->redirectToRoute('book_index');
    }
}
