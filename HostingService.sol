pragma solidity ^0.5.0;

contract HostingService {
    string private host;
    
    address owner;
    mapping(address => string) public html;
    mapping(address => string) public css;
    mapping(address => string) public script;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function getHtml(address _address) public view returns (string memory) {
        return html[_address];
    }
    
    function getCss(address _address) public view returns (string memory) {
        return css[_address];
    }
    
    function getScript(address _address) public view returns (string memory) {
        return script[_address];
    }
    
    function setHtml(string memory _html) public  {
        html[msg.sender] = _html;
    }
    
    function setCss(string memory _css) public  {
        css[msg.sender] = _css;
    }
    
    function setScript(string memory _script) public  {
        script[msg.sender] = _script;
    }
    
    function deletePage(address _address) public onlyOwner {
        html[_address] = "delete page";
        css[_address] = "";
        script[_address] = "";
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}
