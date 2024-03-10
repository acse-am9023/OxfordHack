# Modelo

Modelo is an iOS app that uses Etherlink to allow anyone to reliably and securely link real world assets to the Tezos blockchain using AI generated 3D NFT's.

<p align="center">
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/dcd12d57-4bfe-497e-a25a-734cbf24bedd" alt="Modelo" width="30%" height="auto"/>
</p>


### Inspiration:
Modelo shortens the gap between the physical and digital world, being the first of its kind to leverage AI to make it easy and secure to turn real items into digital assets on Tezos blockchain. This opens up a range of new possibilities of users to interact with their assets in ways like never before paving the way for innovative applications in art, gaming, and beyond.

### Team:
- Artemiy Malyshau: MSc CS and Engineering, Imperial (https://www.linkedin.com/in/artemiy-malyshau/)
- Jeevan Jutla: Previous Binance Security Engineer (https://www.linkedin.com/in/jeevan-jutla/)

### Workflow:
1. The user logs in using Metamask or signs-up using Google O-Auth and Web3Auth, easily onboaring new members into the community.
2. A user captures a photo of the real-world asset they want to upload.
3. The NeRF neural network generates a 3D model from the object from that image.
4. Location, time and other metadata is pulled from the iPhone data.
5. The 3D model is hashed and stored on IPFS using Web3Storage.
6. The digital twin smart contract is deployed containing the metadata and hash of the model.
7. The user signs the transaction using a signer key generated by Apple faceID.
8. The verified asset is then recorded on-chain.
9. Users can view the assets listed for sale in the marketplace and view the objects in AR on the iPhone.
10. The marketplace smart contract fascilitates sales between different users.
11. Users can view their assets in app, in AR and view the attached metadata.


<p align="center">
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/83983416-3ae8-4434-b2a9-7b191a5d19ba" width="50%" />
  <img src="https://github.com/acse-am9023/ethoxford/assets/22000925/cbd78db1-15b9-4651-b2be-c8e7b2d5f9cd" width="50%" />
</p>




### How we built it:
- NeRF Instant NGP
- iOS Frontend with AR Kit
- Hardhat to test and deploy the smart contracts
- Web3Auth as non-custodial way of storing private keys
- NFT digital twin contract: https://testnet-explorer.etherlink.com/tx/0x7199d851bab83caa25ef189ab8cb6d86f60e152615937c4ce0099c90302cbe9f
- Marketplace contract: https://testnet-explorer.etherlink.com/tx/0x8d7c4dc4d99e1cef2eafae1bde8f7e942e1051404f53eca08007ccbccd554d27
- web3 storage for IPFS storage
- JS REST API Backend


### Future Roadmap:
- Expand asset categories and improve 3D modeling accuracy and speed
- oracles for further verification of metadata

By focusing on these aspects, our solution addresses the critical challenges in asset tokenization, offering a novel, secure, and practical approach that adds significant value to the Etherlink ecosystem and beyond.

Usecases:
- Art and Collectibles: Artists and collectors can tokenize their artworks and collectibles, providing a new way to authenticate and trade these items.
- Luxury Goods Authentication:Tokenize high-value items like luxury watches or jewelry to combat counterfeiting and prove authenticity.
- Intellectual Property Rights: Creators can tokenize their intellectual property for easier licensing and enforcement.
