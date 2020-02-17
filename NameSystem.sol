pragma solidity ^0.5.0;

contract NameSystem {
    
    address owner;
    struct NameSet {
        address hostAddress;
        string hostname;
    }
    
    NameSet[] nameSets;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function getHostAddress(string memory _hostname) public view returns (string memory) {
        for(uint i=0;i<nameSets.length;i++){
            if(keccak256(bytes(nameSets[i].hostname))== keccak256(bytes(_hostname))){
                return nameSets[i].hostname;
            }
        }
        return "Address Not Found";
    }
    
    function getHostname(address _hostAddress) public view returns (address) {
        for(uint i=0;i<nameSets.length;i++){
            if(nameSets[i].hostAddress == _hostAddress){
                return nameSets[i].hostAddress;
            }
        }
    }
    
    function setHostname(string memory _hostname) public {
        
        for(uint i=0;i<nameSets.length;i++){
            if(nameSets[i].hostAddress == msg.sender){
                nameSets[i].hostname = _hostname;
                return;
            }
        }
        
        for(uint i=0;i<nameSets.length;i++){
            require(keccak256(bytes(nameSets[i].hostname))== keccak256(bytes(_hostname)));
        }
        nameSets.push(NameSet(msg.sender,_hostname));
    }
    
}
