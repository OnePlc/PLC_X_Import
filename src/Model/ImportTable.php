<?php
/**
 * ImportTable.php - Import Table
 *
 * Table Model for Import
 *
 * @category Model
 * @package Import
 * @author Verein onePlace
 * @copyright (C) 2020 Verein onePlace <admin@1plc.ch>
 * @license https://opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 1.0.0
 */

namespace OnePlace\Import\Model;

use Application\Controller\CoreController;
use Application\Model\CoreEntityTable;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\Sql\Select;
use Laminas\Db\Sql\Where;
use Laminas\Paginator\Paginator;
use Laminas\Paginator\Adapter\DbSelect;

class ImportTable extends CoreEntityTable {

    /**
     * ImportTable constructor.
     *
     * @param TableGateway $tableGateway
     * @since 1.0.0
     */
    public function __construct(TableGateway $tableGateway) {
        parent::__construct($tableGateway);

        # Set Single Form Name
        $this->sSingleForm = 'import-single';
    }

    /**
     * Get Import Entity
     *
     * @param int $id
     * @param string $sKey
     * @return mixed
     * @since 1.0.0
     */
    public function getSingle($id,$sKey = 'Import_ID') {
        # Use core function
        return $this->getSingleEntity($id,$sKey);
    }

    /**
     * Save Import Entity
     *
     * @param Import $oImport
     * @return int Import ID
     * @since 1.0.0
     */
    public function saveSingle(Import $oImport) {
        $aDefaultData = [
            'label' => $oImport->label,
        ];

        return $this->saveSingleEntity($oImport,'Import_ID',$aDefaultData);
    }

    /**
     * Generate new single Entity
     *
     * @return Import
     * @since 1.0.0
     */
    public function generateNew() {
        return new Import($this->oTableGateway->getAdapter());
    }
}