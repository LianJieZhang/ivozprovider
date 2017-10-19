<?php

namespace Ivoz\Ast\Domain\Service\QueueMember;

use Ivoz\Core\Domain\Service\EntityPersisterInterface;
use Ivoz\Provider\Domain\Model\Queue\QueueInterface;
use Ivoz\Provider\Domain\Service\Queue\QueueLifecycleEventHandlerInterface;

class UpdateByIvozQueue implements QueueLifecycleEventHandlerInterface
{
    /**
     * @var EntityPersisterInterface
     */
    protected $entityPersister;

    public function __construct(
        EntityPersisterInterface $entityPersister
    ) {
        $this->entityPersister = $entityPersister;
    }

    public function execute(QueueInterface $entity, $isNew)
    {
        /** @var \Ivoz\Provider\Domain\Model\QueueMember\QueueMemberInterface[] $members */
        $members = $entity->getMembers();

        /** @var \Ivoz\Ast\Domain\Model\QueueMember\QueueMemberInterface[] $astQueueMembers */
        $astQueueMembers = [];

        foreach ($members as $member) {
            $astQueueMembers[] = $member->getAstQueueMember();
        }

        foreach ($astQueueMembers as $astQueueMember) {
            $astQueueMember->setQueueName($entity->getAstQueueName());
            $this
                ->entityPersister
                ->persist($astQueueMember);
        }

    }
}