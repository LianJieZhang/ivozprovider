<?php

namespace Ivoz\Provider\Domain\Model\Locution;

use Assert\Assertion;
use Ivoz\Core\Application\DataTransferObjectInterface;

/**
 * LocutionAbstract
 * @codeCoverageIgnore
 */
abstract class LocutionAbstract
{
    /**
     * @var string
     */
    protected $name;

    /**
     * @comment enum:pending|encoding|ready|error
     * @var string
     */
    protected $status;

    /**
     * @var EncodedFile
     */
    protected $encodedFile;

    /**
     * @var OriginalFile
     */
    protected $originalFile;

    /**
     * @var \Ivoz\Provider\Domain\Model\Company\CompanyInterface
     */
    protected $company;


    /**
     * Changelog tracking purpose
     * @var array
     */
    protected $_initialValues = [];

    /**
     * Constructor
     */
    public function __construct(
        $name,
        EncodedFile $encodedFile,
        OriginalFile $originalFile
    ) {
        $this->setName($name);
        $this->setEncodedFile($encodedFile);
        $this->setOriginalFile($originalFile);

        $this->initChangelog();
    }

    /**
     * @param string $fieldName
     * @return mixed
     * @throws \Exception
     */
    public function initChangelog()
    {
        $values = $this->__toArray();
        if (!$this->getId()) {
            // Empty values for entities with no Id
            foreach ($values as $key => $val) {
                $values[$key] = null;
            }
        }

        $this->_initialValues = $values;
    }

    /**
     * @param string $fieldName
     * @return mixed
     * @throws \Exception
     */
    public function hasChanged($dbFieldName)
    {
        if (!array_key_exists($dbFieldName, $this->_initialValues)) {
            throw new \Exception($dbFieldName . ' field was not found');
        }
        $currentValues = $this->__toArray();

        return $currentValues[$dbFieldName] != $this->_initialValues[$dbFieldName];
    }

    public function getInitialValue($dbFieldName)
    {
        if (!array_key_exists($dbFieldName, $this->_initialValues)) {
            throw new \Exception($dbFieldName . ' field was not found');
        }

        return $this->_initialValues[$dbFieldName];
    }

    /**
     * @return array
     */
    public function getChangeSet()
    {
        return array_diff(
            $this->_initialValues,
            $this->__toArray()
        );
    }

    /**
     * @return LocutionDTO
     */
    public static function createDTO()
    {
        return new LocutionDTO();
    }

    /**
     * Factory method
     * @param DataTransferObjectInterface $dto
     * @return self
     */
    public static function fromDTO(DataTransferObjectInterface $dto)
    {
        /**
         * @var $dto LocutionDTO
         */
        Assertion::isInstanceOf($dto, LocutionDTO::class);

        $encodedFile = new EncodedFile(
            $dto->getEncodedFileFileSize(),
            $dto->getEncodedFileMimeType(),
            $dto->getEncodedFileBaseName()
        );

        $originalFile = new OriginalFile(
            $dto->getOriginalFileFileSize(),
            $dto->getOriginalFileMimeType(),
            $dto->getOriginalFileBaseName()
        );

        $self = new static(
            $dto->getName(),
            $encodedFile,
            $originalFile
        );

        return $self
            ->setStatus($dto->getStatus())
            ->setCompany($dto->getCompany())
        ;
    }

    /**
     * @param DataTransferObjectInterface $dto
     * @return self
     */
    public function updateFromDTO(DataTransferObjectInterface $dto)
    {
        /**
         * @var $dto LocutionDTO
         */
        Assertion::isInstanceOf($dto, LocutionDTO::class);

        $encodedFile = new EncodedFile(
            $dto->getEncodedFileFileSize(),
            $dto->getEncodedFileMimeType(),
            $dto->getEncodedFileBaseName()
        );

        $originalFile = new OriginalFile(
            $dto->getOriginalFileFileSize(),
            $dto->getOriginalFileMimeType(),
            $dto->getOriginalFileBaseName()
        );

        $this
            ->setName($dto->getName())
            ->setStatus($dto->getStatus())
            ->setEncodedFile($encodedFile)
            ->setOriginalFile($originalFile)
            ->setCompany($dto->getCompany());


        return $this;
    }

    /**
     * @return LocutionDTO
     */
    public function toDTO()
    {
        return self::createDTO()
            ->setName($this->getName())
            ->setStatus($this->getStatus())
            ->setEncodedFileFileSize($this->getEncodedFile()->getFileSize())
            ->setEncodedFileMimeType($this->getEncodedFile()->getMimeType())
            ->setEncodedFileBaseName($this->getEncodedFile()->getBaseName())
            ->setOriginalFileFileSize($this->getOriginalFile()->getFileSize())
            ->setOriginalFileMimeType($this->getOriginalFile()->getMimeType())
            ->setOriginalFileBaseName($this->getOriginalFile()->getBaseName())
            ->setCompanyId($this->getCompany() ? $this->getCompany()->getId() : null);
    }

    /**
     * @return array
     */
    protected function __toArray()
    {
        return [
            'name' => self::getName(),
            'status' => self::getStatus(),
            'encodedFileFileSize' => self::getEncodedFile()->getFileSize(),
            'encodedFileMimeType' => self::getEncodedFile()->getMimeType(),
            'encodedFileBaseName' => self::getEncodedFile()->getBaseName(),
            'originalFileFileSize' => self::getOriginalFile()->getFileSize(),
            'originalFileMimeType' => self::getOriginalFile()->getMimeType(),
            'originalFileBaseName' => self::getOriginalFile()->getBaseName(),
            'companyId' => self::getCompany() ? self::getCompany()->getId() : null
        ];
    }


    // @codeCoverageIgnoreStart

    /**
     * Set name
     *
     * @param string $name
     *
     * @return self
     */
    public function setName($name)
    {
        Assertion::notNull($name);
        Assertion::maxLength($name, 50);

        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set status
     *
     * @param string $status
     *
     * @return self
     */
    public function setStatus($status = null)
    {
        if (!is_null($status)) {
            Assertion::maxLength($status, 20);
        Assertion::choice($status, array (
          0 => 'pending',
          1 => 'encoding',
          2 => 'ready',
          3 => 'error',
        ));
        }

        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set company
     *
     * @param \Ivoz\Provider\Domain\Model\Company\CompanyInterface $company
     *
     * @return self
     */
    public function setCompany(\Ivoz\Provider\Domain\Model\Company\CompanyInterface $company)
    {
        $this->company = $company;

        return $this;
    }

    /**
     * Get company
     *
     * @return \Ivoz\Provider\Domain\Model\Company\CompanyInterface
     */
    public function getCompany()
    {
        return $this->company;
    }

    /**
     * Set encodedFile
     *
     * @param \Ivoz\Provider\Domain\Model\Locution\EncodedFile $encodedFile
     *
     * @return self
     */
    public function setEncodedFile(EncodedFile $encodedFile)
    {
        $this->encodedFile = $encodedFile;

        return $this;
    }

    /**
     * Get encodedFile
     *
     * @return \Ivoz\Provider\Domain\Model\Locution\EncodedFile
     */
    public function getEncodedFile()
    {
        return $this->encodedFile;
    }

    /**
     * Set originalFile
     *
     * @param \Ivoz\Provider\Domain\Model\Locution\OriginalFile $originalFile
     *
     * @return self
     */
    public function setOriginalFile(OriginalFile $originalFile)
    {
        $this->originalFile = $originalFile;

        return $this;
    }

    /**
     * Get originalFile
     *
     * @return \Ivoz\Provider\Domain\Model\Locution\OriginalFile
     */
    public function getOriginalFile()
    {
        return $this->originalFile;
    }

    // @codeCoverageIgnoreEnd
}

