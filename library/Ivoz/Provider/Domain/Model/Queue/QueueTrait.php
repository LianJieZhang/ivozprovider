<?php

namespace Ivoz\Provider\Domain\Model\Queue;

use Ivoz\Core\Application\DataTransferObjectInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\Criteria;

/**
 * QueueTrait
 * @codeCoverageIgnore
 */
trait QueueTrait
{
    /**
     * @var integer
     */
    protected $id;

    /**
     * @var Collection
     */
    protected $members;


    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct(...func_get_args());
        $this->members = new ArrayCollection();
    }

    /**
     * @return QueueDTO
     */
    public static function createDTO()
    {
        return new QueueDTO();
    }

    /**
     * Factory method
     * @param DataTransferObjectInterface $dto
     * @return self
     */
    public static function fromDTO(DataTransferObjectInterface $dto)
    {
        /**
         * @var $dto QueueDTO
         */
        $self = parent::fromDTO($dto);
        if ($dto->getMembers()) {
            $self->replaceMembers($dto->getMembers());
        }
        if ($dto->getId()) {
            $self->id = $dto->getId();
            $self->initChangelog();
        }

        return $self;
    }

    /**
     * @param DataTransferObjectInterface $dto
     * @return self
     */
    public function updateFromDTO(DataTransferObjectInterface $dto)
    {
        /**
         * @var $dto QueueDTO
         */
        parent::updateFromDTO($dto);
        if ($dto->getMembers()) {
            $this->replaceMembers($dto->getMembers());
        }
        return $this;
    }

    /**
     * @return QueueDTO
     */
    public function toDTO()
    {
        $dto = parent::toDTO();
        return $dto
            ->setId($this->getId());
    }

    /**
     * @return array
     */
    protected function __toArray()
    {
        return parent::__toArray() + [
            'id' => self::getId()
        ];
    }


    /**
     * Add member
     *
     * @param \Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface $member
     *
     * @return QueueTrait
     */
    public function addMember(\Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface $member)
    {
        $this->members->add($member);

        return $this;
    }

    /**
     * Remove member
     *
     * @param \Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface $member
     */
    public function removeMember(\Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface $member)
    {
        $this->members->removeElement($member);
    }

    /**
     * Replace members
     *
     * @param \Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface[] $members
     * @return self
     */
    public function replaceMembers(Collection $members)
    {
        $updatedEntities = [];
        $fallBackId = -1;
        foreach ($members as $entity) {
            $index = $entity->getId() ? $entity->getId() : $fallBackId--;
            $updatedEntities[$index] = $entity;
            $entity->setQueue($this);
        }
        $updatedEntityKeys = array_keys($updatedEntities);

        foreach ($this->members as $key => $entity) {
            $identity = $entity->getId();
            if (in_array($identity, $updatedEntityKeys)) {
                $this->members->set($key, $updatedEntities[$identity]);
            } else {
                $this->members->remove($key);
            }
            unset($updatedEntities[$identity]);
        }

        foreach ($updatedEntities as $entity) {
            $this->addMember($entity);
        }

        return $this;
    }

    /**
     * Get members
     *
     * @return array
     */
    public function getMembers(Criteria $criteria = null)
    {
        if (!is_null($criteria)) {
            return $this->members->matching($criteria)->toArray();
        }

        return $this->members->toArray();
    }


}

