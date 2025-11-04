![Solidity](https://img.shields.io/badge/Solidity-0.8.30-blue) ![Foundry](https://img.shields.io/badge/Framework-Foundry-%23E9573F) ![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-Contracts-green) ![License](https://img.shields.io/badge/License-MIT-yellow) ![Network](https://img.shields.io/badge/Deployed%20on-Sepolia%20Testnet-orange)
## Husky NFT Collection
**Husky NFT** is an ERC-721 collection deployed on the Sepolia test network. Each token represents a unique, loyal husky from the *PetNFT* series, fully stored on IPFS for immutable metadata and decentralized image hosting. The project demonstrates clean NFT architecture, Foundry automation, and IPFS-integrated asset management.

---
## Overview
- **Contract Name:** `NFT`
- **Symbol:** `HSKY`
- **Standard:** ERC-721 (OpenZeppelin)
- **Language:** Solidity `^0.8.0`
- **Framework:** Foundry
- **Network:** Sepolia Testnet
- **Storage:** IPFS (metadata + media)
---
## Features
- `_safeMint` prevents NFTs from being lost on incompatible contracts  
- On-chain metadata mapping for each token  
- Full IPFS integration for decentralized hosting  
- Automated deployment and minting via Foundry scripts  
- Makefile for quick environment setup and network management

---
## Deployment & Minting
### 1️⃣ Environment Setup  
Create a `.env` file with:  
`SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_KEY`  
`PRIVATE_KEY=YOUR_PRIVATE_KEY`  
`ETHERSCAN_API_KEY=YOUR_ETHERSCAN_KEY`  
### 2️⃣ Deploy the Contract  
`make deploy ARGS="--network sepolia"`  
### 3️⃣ Mint an NFT  
`make mint ARGS="--network sepolia"`  
The mint script automatically detects the latest deployment and mints a new NFT with the given IPFS metadata.

---
## Example Metadata (IPFS)
    {
      "name": "Pet NFT #0",
      "description": "A loyal blue-eyed husky from the PetNFT collection.",
      "image": "https://ipfs.io/ipfs/QmbVtMqzmHpcdnxC6dHBPQmjqt7S5AKsuBXdsfsrgv4xnF",
      "attributes": [
        { "trait_type": "Fur", "value": "Gray and White" },
        { "trait_type": "Eyes", "value": "Blue" },
        { "trait_type": "Mood", "value": "Playful" }
      ]
    }
---
## Resources
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Foundry Documentation](https://book.getfoundry.sh/)
- [IPFS Documentation](https://docs.ipfs.tech/)
---
## License
MIT

--- 
## Status

**Deployed on:** Sepolia Testnet [(View on Etherscan)](https://sepolia.etherscan.io/address/0xd24445002233fcd122ed44c66186cf59b512a2aa)   

