<?php

namespace App\Security;

use App\Entity\User; // your user entity
use Doctrine\ORM\EntityManagerInterface;
use KnpU\OAuth2ClientBundle\Client\ClientRegistry;
use KnpU\OAuth2ClientBundle\Security\Authenticator\OAuth2Authenticator;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\Authenticator\Passport\SelfValidatingPassport;


class GithubAuthenticator extends OAuth2Authenticator
{
    private $clientRegistry;
    private $entityManager;
    private $router;

    public function __construct(ClientRegistry $clientRegistry, EntityManagerInterface $entityManager, RouterInterface $router)
    {
        $this->clientRegistry = $clientRegistry;
        $this->entityManager = $entityManager;
        $this->router = $router;
    }

    public function supports(Request $request): ?bool
    {
        // continue ONLY if the current ROUTE matches the check ROUTE
        return $request->attributes->get('_route') === 'connect_github_check';
    }

    public function authenticate(Request $request): Passport
    {
        $client = $this->clientRegistry->getClient('github');
        $accessToken = $this->fetchAccessToken($client);

        return new SelfValidatingPassport(
            new UserBadge($accessToken->getToken(), function() use ($accessToken, $client) {
                /** @var GithubResourceOwner $githubResourceOwner */
                $githubResourceOwner = $client->fetchUserFromToken($accessToken);

                $email = $githubResourceOwner->getEmail();

                // 1) have they logged in with Github before? Easy!
                $existingUser = $this->entityManager->getRepository(User::class)->findOneBy(['githubId' => $githubResourceOwner->getId()]);

                if ($existingUser) {
                    return $existingUser;
                } else {
                     // 2) do we have a matching user by email?
                $user = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);

                // If it still doesn't exist, you need to create a new one
            // Here comes the custom logic of the creation of your user
            if (!$user) {

                // e.g. This is just an example, it depends of your user entity, so be sure to modify this
                /** @var User $user */
                $user = new User();
                $user->setLastname($lastname["name"]);
                $user->setPassword(null);
                $user->setEmail($email);
            }
                }

               

                // 3) Maybe you just want to "register" them by creating
                // a User object
                $user->setGithubId($githubResourceOwner->getId());
                $this->entityManager->persist($user);
                $this->entityManager->flush();

                return $user;
            })
        );
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, string $firewallName): ?Response
    {
        // change "app_homepage" to some route in your app
        $targetUrl = $this->router->generate('app_home');

        return new RedirectResponse($targetUrl);
    
        // or, on success, let the request continue to be handled by the controller
        //return null;
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception): ?Response
    {
        $message = strtr($exception->getMessageKey(), $exception->getMessageData());

        return new Response($message, Response::HTTP_FORBIDDEN);
    }
}