// SPDX-Licence-Identifier: MIT 
pragma solidity ^0.8.0;

contract SimpleStorage 
{
    // tipos de funciones publica privada externa interna
    uint256 favoriteNumber;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    // defino un array
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    // ingreso un uin256
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
     
    // funciones con transacciones view o pure
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    
    // pusheo en el array
    // guardo en memory, dura llo que dura la funcion o en storage permanece despues de la funcion
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People({favoriteNumber:_favoriteNumber,name:_name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
}
