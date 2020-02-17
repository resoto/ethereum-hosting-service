pragma solidity ^0.5.0;

contract HostingService {
    
    address owner;
    
    struct Page {
        string html;
        string css;
        string script;
    }
    
    mapping(address => Page) public pages;
    
    
    
    constructor () public {
        owner = msg.sender;
    }
    
    function getHtml(address _address) public view returns (string memory) {
        return pages[_address].html;
    }
    
    function getCss(address _address) public view returns (string memory) {
        return pages[_address].css;
    }
    
    function getScript(address _address) public view returns (string memory) {
        return pages[_address].html;
    }
    
    function setHtml(string memory _html) public  {
        pages[msg.sender].html = _html;
    }
    
    function setCss(string memory _css) public  {
        pages[msg.sender].css = _css;
    }
    
    function setScript(string memory _script) public  {
        pages[msg.sender].script = _script;
    }
    
    function deletePage(address _address) public onlyOwner {
        pages[_address].html = "delete page";
        pages[_address].css = "";
        pages[_address].script = "";
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    
}
