<?php

namespace Ivoz\Provider\Domain\Model\CompanyService;

/**
 * CompanyService
 */
class CompanyService extends CompanyServiceAbstract implements CompanyServiceInterface
{
    use CompanyServiceTrait;

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
}
