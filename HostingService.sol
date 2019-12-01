pragma solidity ^0.5.0;

contract HostingService {
    string private host;
    
    function getHost() public view returns (string memory) {
        return host;
        
    }
   
}

