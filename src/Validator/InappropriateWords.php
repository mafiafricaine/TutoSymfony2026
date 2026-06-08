<?php

namespace App\Validator;

use Symfony\Component\Validator\Constraint;

#[\Attribute(\Attribute::TARGET_PROPERTY | \Attribute::TARGET_METHOD | \Attribute::IS_REPEATABLE)]
final class InappropriateWords extends Constraint
{
    //On crée un constructeur qui reçoit la liste des mots et le message approprié quand ca ne va pas
    //Je lui rajoute aussi les paramètres que reçoit le constructeur parent
    //a l'interieur on appel le constructeur parent
    public function __construct(
        public array $listWords = ['merde', 'wesh', 'imbécile'],
        public string $message = 'This contains an inappropriate word "{{ inappropriateWord }}".',
        mixed $options = null,
        ?array $groups = null,
        mixed $payload = null
    ) {
        parent::__construct($options, $groups, $payload);
    }
}

// #[\Attribute(\Attribute::TARGET_PROPERTY | \Attribute::TARGET_METHOD | \Attribute::IS_REPEATABLE)]
// final class InappropriateWords extends Constraint
// {
//     public string $message = 'The string "{{ value }}" contains an illegal character: it can only contain letters or numbers.';

//     // You can use #[HasNamedArguments] to make some constraint options required.
//     // All configurable options must be passed to the constructor.
//     public function __construct(
//         public string $mode = 'strict',
//         ?array $groups = null,
//         mixed $payload = null,
//     ) {
//         parent::__construct([], $groups, $payload);
//     }
// }
