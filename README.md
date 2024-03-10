# Modelo

Modelo is an iOS app that uses Etherlink rollups and machine learning to tokenise real world assets into 3D NFTs while providing a marketplace to view and transfer them in AR.

<p align="center">
  <img src="https://github.com/acse-am9023/ethoxford/assets/142490406/95fb7974-56ae-4cda-bb5b-33d2d05cc0ff" alt="Modelo" width="30%" height="auto"/>
</p>

## Inspiration
Modelo addresses the need for a secure, reliable and easy to use platform for users to transform physical assets into verifiable tokens. It reduces the gap between the physical and digital world, being the first of its kind to leverage AI to cheaply and reliably tokenise real world items into digital assets on Tezos blockchain. This opens up a range of new possibilities for users to interact with their assets in ways like never before paving the way for innovative applications in art, gaming, and beyond.

## Images
<p align="center">
<img src=https://github.com/acse-am9023/ethoxford/assets/22000925/6dbaade5-08fb-48f3-93ca-10acb68d0d74 width=20% >
<img src=https://github.com/acse-am9023/ethoxford/assets/22000925/5e85da88-842e-4f5a-ab35-f3d2268388cb width=20% >
<img src=https://github.com/acse-am9023/ethoxford/assets/22000925/5e5324b3-a8f1-491e-8751-fc7bb0bb7789 width=20% >
<img src=https://github.com/acse-am9023/ethoxford/assets/22000925/fd8637d6-c447-4490-98cf-30798e0df69c width=20% >
</p>

<p align="center">
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/83983416-3ae8-4434-b2a9-7b191a5d19ba" width="52%" />
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/cbd78db1-15b9-4651-b2be-c8e7b2d5f9cd" width="46%" />
</p>

## Team
- Artemiy Malyshau: MSc CS and Engineering, Imperial [Connect](https://www.linkedin.com/in/artemiy-malyshau/)
- Jeevan Jutla: Binance Security Engineer [Connect](https://www.linkedin.com/in/jeevan-jutla/)

## Workflow
1. The user logs in using Metamask or creates an account using a walletless onboarding using Google O-Auth and Web3Auth.
2. A user captures a photo of the real-world asset they want to tokenize.
3. The NeRF neural network generates a 3D model of the object from that image.
4. Location, time and price metadata is stored in the transaction.
5. The 3D model is hashed and stored on IPFS using Web3Storage.
6. The digital twin smart contract is deployed containing the metadata and hash of the model.
7. The user signs the transaction using a signer key generated by Apple faceID.
8. The verified asset is then recorded on-chain.
9. Users can view the assets listed for sale in the marketplace and view the objects in AR on the iPhone.
10. The marketplace smart contract facilitates sales between users.
11. Users can view their assets in app, in AR and view the attached metadata.


### How we built it

- Etherlink: Serves as the underlying blockchain infrastructure providing EVM compatibility, secure and affordable asset tokenization using its decentralised sequencer and low gas fees, and reliable data handling through its fair ordering and integration with the Tezos protocol.
- NeRF Instant NGP: To generate a 3D model from an image  [Research Paper](https://docs.nerf.studio/nerfology/methods/instant_ngp.html), [Code](https://github.com/acse-am9023/ethoxford/tree/main/nerf)
- iOS Frontend & AR Kit:  [Code](https://github.com/acse-am9023/ethoxford/tree/main/modelo_ios)
- Hardhat: To test and deploy the smart contracts
- Web3Auth: As non-custodial way of storing private keys for a walletless onboarding experiance.
- NFT digital twin contract: Containing metadata and hashes to to model [Deployed Contract](https://testnet-explorer.etherlink.com/tx/0x7199d851bab83caa25ef189ab8cb6d86f60e152615937c4ce0099c90302cbe9f), [Code](https://github.com/acse-am9023/ethoxford/blob/main/web3/contracts/NFT.sol) 
- Marketplace contract: To manage transactions of tokens between users [Deployed Contract](https://testnet-explorer.etherlink.com/tx/0x8d7c4dc4d99e1cef2eafae1bde8f7e942e1051404f53eca08007ccbccd554d27),[Code](https://github.com/acse-am9023/ethoxford/blob/main/web3/contracts/Marketplace.sol)
- Web3Storage API: For IPFS storage of the generated model
- JS REST API Backend: To manaage backend calls with the UI 
- AWS EC2: To run the neural network on distributed GPU's to generate the model in ~45 seconds.

### Etherlink
Etherlink is an excellent fit for Modelo, as its Ethereum compatibility allows for smooth transfer of digital assets between different blockchain networks, hinting at a future with a much larger market for users. This feature means users can easily access and trade their tokenized assets in a wider blockchain ecosystem. Additionally, Etherlink's low fees make it more affordable for users to tokenize and manage their assets, encouraging broader participation. The platform's strong defense against MEV attacks and its secure, decentralized transaction system ensure that users' assets are safe and their transactions are fair and transparent. This combination of accessibility, affordability, and security makes Etherlink a smart choice for Modelo, promising an enhanced and user-friendly experience in the world of digital asset tokenization.

### Architecture Diagram
<p align="center">
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/a22219f7-50b4-4377-9356-3dd287b23bac" alt="Arch" width="110%" height="auto"/>
</p>

### Future Roadmap
- Improve 3D modeling accuracy and speed
- Oracles for further verification of metadata
- Chainlink CCIP to transfer modified ERC-721 tokens cross chain

By focusing on these aspects, our solution addresses the critical challenges in asset tokenization, offering a novel, secure, and practical approach that adds significant value to the Etherlink ecosystem and beyond.

### Usecases
- Art and Collectibles: Artists and collectors can tokenize their artworks and collectibles, providing a new way to authenticate and trade these items.
- Luxury Goods Authentication:Tokenize high-value items like luxury watches or jewelry to combat counterfeiting and prove authenticity.
- Intellectual Property Rights: Creators can tokenize their intellectual property for easier licensing and enforcement.
- etc.
