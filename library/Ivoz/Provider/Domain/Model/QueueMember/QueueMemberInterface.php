<?php

namespace Ivoz\Provider\Domain\Model\QueueMember;

use Ivoz\Core\Domain\Model\EntityInterface;

interface QueueMemberInterface extends EntityInterface
{
    /**
     * Set penalty
     *
     * @param integer $penalty
     *
     * @return self
     */
    public function setPenalty($penalty = null);

    /**
     * Get penalty
     *
     * @return integer
     */
    public function getPenalty();

    /**
     * Set astQueueMember
     *
     * @param \Ivoz\Ast\Domain\Model\QueueMember\QueueMemberInterface $astQueueMember
     *
     * @return self
     */
    public function setAstQueueMember(\Ivoz\Ast\Domain\Model\QueueMember\QueueMemberInterface $astQueueMember = null);

    /**
     * Get astQueueMember
     *
     * @return \Ivoz\Ast\Domain\Model\QueueMember\QueueMemberInterface
     */
    public function getAstQueueMember();

    /**
     * Set queue
     *
     * @param \Ivoz\Provider\Domain\Model\Queue\QueueInterface $queue
     *
     * @return self
     */
    public function setQueue(\Ivoz\Provider\Domain\Model\Queue\QueueInterface $queue = null);

    /**
     * Get queue
     *
     * @return \Ivoz\Provider\Domain\Model\Queue\QueueInterface
     */
    public function getQueue();

    /**
     * Set user
     *
     * @param \Ivoz\Provider\Domain\Model\User\UserInterface $user
     *
     * @return self
     */
    public function setUser(\Ivoz\Provider\Domain\Model\User\UserInterface $user = null);

    /**
     * Get user
     *
     * @return \Ivoz\Provider\Domain\Model\User\UserInterface
     */
    public function getUser();

}

