<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Emprunt;
use App\Repository\BookRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/m/book')]
class BookController extends AbstractController
{
    #[Route('/', name: 'book_index')]
    public function index(BookRepository $bookRepository): Response
    {
        $books = $bookRepository->findActiveBooks();
        return $this->render('book/index.html.twig', [
            'books' => $books,
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
