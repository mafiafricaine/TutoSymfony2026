<?php

namespace App\Entity;

use App\Entity\Traits\Timestampable;
use App\Repository\RecipeRepository;
use App\Validator\InappropriateWords;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: RecipeRepository::class)]
#[ORM\Table(name: "recipes")]
#[ORM\HasLifecycleCallbacks]
#[UniqueEntity('title')]
class Recipe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: "Le champ ne peut pas être vide !")]
    #[Assert\Length(min: 10,max: 50,minMessage: "Le champ doit contenir minimum 10 caractères !", maxMessage: "Le champ doit contenir maximum 50 caractères !")]
    #[InappropriateWords()]
    private ?string $title = null;

    #[ORM\Column(length: 255)]
    private ?string $slug = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message: "Oups !! Le champ ne peut pas être vide !")]
    #[Assert\Length(min: 20,minMessage: "Le champ doit contenir minimum 20 caractères !")]
    private ?string $content = null;

    use Timestampable;

    #[ORM\Column(nullable: true)]
    #[Assert\NotBlank(message: "Le champ ne peut pas être vide !")]
    #[Assert\Positive(message: "Le champ doit être positif !")]
    #[Assert\LessThanOrEqual(1440,message: "Le champ ne doit pas dépasser 24h !")]
    private ?int $duration = null;

    #[ORM\Column(length: 500, nullable: true)]
    private ?string $imageName = "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg";

    #[ORM\ManyToOne(inversedBy: 'recipes')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): static
    {
        $this->slug = $slug;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): static
    {
        $this->content = $content;

        return $this;
    }

    

    public function getDuration(): ?int
    {
        return $this->duration;
    }

    public function setDuration(?int $duration): static
    {
        $this->duration = $duration;

        return $this;
    }

    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    public function setImageName(?string $imageName): static
    {
        $this->imageName = $imageName;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }
}
