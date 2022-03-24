// SPDX-Licence_Identifier:MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


// con el is heredo todas las funcionesde Simpletorage
contract StorageFactory is SimpleStorage {

    //yo soy el array de "arriba"
    SimpleStorage[] public simpleStorageArray;

    //crea el contract y lo mete en un array
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage =new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // mete un numero en uno de los contracts en el array de arriba
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // para interactuar con un contract necesito
        // address y
        // abi application binary interface
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);

    }

    // mostramos
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();

    }
}
