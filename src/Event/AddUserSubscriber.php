<?php

namespace App\Event;

use App\Entity\Book;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AddUserSubscriber implements EventSubscriberInterface
{
    private $security;
    public function __construct(\Symfony\Component\Security\Core\Security $security)
    {
        $this->security = $security;
    }

    public static function getSubscribedEvents()
    {
        return [
            BeforeEntityPersistedEvent::class => ['setUserToBook'],
        ];
    }

    public function setUserToBook (BeforeEntityPersistedEvent $event)
    {
        $book = $event->getEntityInstance();

        if (!($book instanceof Book)) {
            return;
        }

        $user = $this->security->getUser();
        $book->setUser($user);
    }
}