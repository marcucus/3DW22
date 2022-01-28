<?php
 namespace App\Controller;
 use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

 class DefaultController extends AbstractController
 {
     #[Route('/', name: 'front_index')]
     public function index(){
         return $this->render('Default/index.html.twig');
     }

 }
?>