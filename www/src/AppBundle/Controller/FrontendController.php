<?php

namespace AppBundle\Controller;

use Pimcore\Controller\FrontendController as BaseFrontendController;
use Symfony\Component\HttpKernel\Event\FilterControllerEvent;

abstract class FrontendController extends BaseFrontendController
{
    /**
     * @inheritDoc
     */
    public function onKernelController(FilterControllerEvent $event)
    {
        // enable twig view auto-rendering
        $this->setViewAutoRender($event->getRequest(), true, 'twig');
    }
}
