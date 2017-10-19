<?php

namespace Ivoz\Provider\Domain\Model\QueueMember;

use Ivoz\Core\Application\DataTransferObjectInterface;
use Ivoz\Core\Application\ForeignKeyTransformerInterface;
use Ivoz\Core\Application\CollectionTransformerInterface;

/**
 * @codeCoverageIgnore
 */
class QueueMemberDTO implements DataTransferObjectInterface
{
    /**
     * @var integer
     */
    private $penalty;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var mixed
     */
    private $astQueueMemberId;

    /**
     * @var mixed
     */
    private $queueId;

    /**
     * @var mixed
     */
    private $userId;

    /**
     * @var mixed
     */
    private $astQueueMember;

    /**
     * @var mixed
     */
    private $queue;

    /**
     * @var mixed
     */
    private $user;

    /**
     * @return array
     */
    public function __toArray()
    {
        return [
            'penalty' => $this->getPenalty(),
            'id' => $this->getId(),
            'astQueueMemberId' => $this->getAstQueueMemberId(),
            'queueId' => $this->getQueueId(),
            'userId' => $this->getUserId()
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function transformForeignKeys(ForeignKeyTransformerInterface $transformer)
    {
        $this->astQueueMember = $transformer->transform('Ivoz\\Ast\\Domain\\Model\\QueueMember\\QueueMember', $this->getAstQueueMemberId());
        $this->queue = $transformer->transform('Ivoz\\Provider\\Domain\\Model\\Queue\\Queue', $this->getQueueId());
        $this->user = $transformer->transform('Ivoz\\Provider\\Domain\\Model\\User\\User', $this->getUserId());
    }

    /**
     * {@inheritDoc}
     */
    public function transformCollections(CollectionTransformerInterface $transformer)
    {

    }

    /**
     * @param integer $penalty
     *
     * @return QueueMemberDTO
     */
    public function setPenalty($penalty = null)
    {
        $this->penalty = $penalty;

        return $this;
    }

    /**
     * @return integer
     */
    public function getPenalty()
    {
        return $this->penalty;
    }

    /**
     * @param integer $id
     *
     * @return QueueMemberDTO
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param array $astQueueMember
     *
     * @return QueueMemberDTO
     */
    public function setAstQueueMember($astQueueMember)
    {
        $this->astQueueMember = $astQueueMember;

        return $this;
    }

    /**
     * @return array
     */
    public function getAstQueueMember()
    {
        return $this->astQueueMember;
    }

    /**
     * @param integer $queueId
     *
     * @return QueueMemberDTO
     */
    public function setQueueId($queueId)
    {
        $this->queueId = $queueId;

        return $this;
    }

    /**
     * @return integer
     */
    public function getQueueId()
    {
        return $this->queueId;
    }

    /**
     * @return \Ivoz\Provider\Domain\Model\Queue\Queue
     */
    public function getQueue()
    {
        return $this->queue;
    }

    /**
     * @param integer $userId
     *
     * @return QueueMemberDTO
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * @return integer
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @return \Ivoz\Provider\Domain\Model\User\User
     */
    public function getUser()
    {
        return $this->user;
    }
}

