<?php

namespace App\Controller\Admin;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Symfony\Component\Intl;
use App\Entity\Book;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Vich\UploaderBundle\Form\Type\VichImageType;
use Vich\UploaderBundle\Mapping\Annotation\UploadableField;
use Vich\UploaderBundle\VichUploaderBundle;

class BookCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Book::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title','Titre')->setColumns(8),
            AssociationField::new('category','Catégorie')->setColumns(8)->autocomplete(),
            TextEditorField::new('description','Description')->setColumns(8)->hideOnIndex(),
            DateField::new('publishAt','Publication'),
            TextField::new('author','Auteur')->setColumns(8)->hideOnIndex(),
            NumberField::new('nbPage','Nombre de page')->setColumns(8),
            TextareaField::new('imageFile')->hideOnIndex()->setFormType(VichImageType::class)->setColumns(8),
            NumberField::new('nbExemplaire','Nombre d\'exemplaires')->setColumns(8),
            BooleanField::new('isActive','Activé ?')->setColumns(8),
        ];
    }
}
