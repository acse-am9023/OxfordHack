// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DigitalTwinNFT is ERC721URIStorage, Ownable {
    uint256 private _currentTokenId = 0;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mintNFT(address recipient, string memory metadataURI) public onlyOwner returns (uint256) {
        _currentTokenId++;
        _mint(recipient, _currentTokenId);
        _setTokenURI(_currentTokenId, metadataURI);
        return _currentTokenId;
    }

    function burnNFT(uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Caller is not owner nor approved.");
        _burn(tokenId);
    }

    function updateTokenURI(uint256 tokenId, string memory newURI) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Caller is not owner nor approved.");
        _setTokenURI(tokenId, newURI);
    }

    function transferNFT(address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Caller is not owner nor approved.");
        _transfer(_msgSender(), to, tokenId);
    }

    function ownerOfNFT(uint256 tokenId) public view returns (address) {
        return ownerOf(tokenId);
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory) {
        return tokenURI(tokenId);
    }

