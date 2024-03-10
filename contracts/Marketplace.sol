// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFTMarketplace is ReentrancyGuard {
    struct Listing {
        address seller;
        address nftContract;
        uint256 tokenId;
        uint256 price;
        bool active;
    }

    mapping(uint256 => Listing) private _listings;
    uint256 private _currentListingId = 0;

    event Listed(uint256 indexed listingId, address indexed seller, address indexed nftContract, uint256 tokenId, uint256 price);
    event Sale(uint256 indexed listingId, address indexed buyer, address indexed nftContract, uint256 tokenId, uint256 price);
    event Delisted(uint256 indexed listingId);
    event ListingPriceUpdated(uint256 indexed listingId, uint256 newPrice);
    event ListingTransferred(uint256 indexed listingId, address newSeller);

    function listNFT(address nftContract, uint256 tokenId, uint256 price) public returns (uint256) {
        IERC721 nft = IERC721(nftContract);
        require(nft.ownerOf(tokenId) == msg.sender, "Only the owner can list the NFT.");
        require(nft.isApprovedForAll(msg.sender, address(this)), "Marketplace not approved to transfer NFT.");

        _currentListingId++;
        _listings[_currentListingId] = Listing(msg.sender, nftContract, tokenId, price, true);
        emit Listed(_currentListingId, msg.sender, nftContract, tokenId, price);
        return _currentListingId;
    }

    function buyNFT(uint256 listingId) public payable nonReentrant {
        Listing memory listing = _listings[listingId];
        require(listing.active, "Listing is not active.");
        require(msg.value >= listing.price, "Insufficient payment.");

        payable(listing.seller).transfer(listing.price);
        IERC721(listing.nftContract).safeTransferFrom(listing.seller, msg.sender, listing.tokenId);

        listing.active = false;
        _listings[listingId] = listing;
        emit Sale(listingId, msg.sender, listing.nftContract, listing.tokenId, listing.price);
    }

    function delistNFT(uint256 listingId) public {
        Listing memory listing = _listings[listingId];
        require(listing.seller == msg.sender, "Only the seller can delist the NFT.");
        listing.active = false;
        _listings[listingId] = listing;
        emit Delisted(listingId);
    }

    function updateListingPrice(uint256 listingId, uint256 newPrice) public {
        Listing storage listing = _listings[listingId];
        require(listing.seller == msg.sender, "Only the seller can update the price.");
        listing.price = newPrice;
        emit ListingPriceUpdated(listingId, newPrice);
    }

    function transferListing(uint256 listingId, address newSeller) public {
        Listing storage listing = _listings[listingId];
        require(listing.seller == msg.sender, "Only the seller can transfer the listing.");
        listing.seller = newSeller;
        emit ListingTransferred(listingId, newSeller);
    }
}
