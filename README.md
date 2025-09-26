# 🗳️ Decentralized Voting System

A simple smart contract for a decentralized voting system using Solidity + Hardhat.

## ✨ Features
- Create new proposals
- Vote on available proposals
- Protection: 1 address = 1 vote per proposal
- Event log for transparency (on-chain record)

## 🚀 How to Run

### 1. Clone repo
```bash
git clone https://github.com/<username>/decentralized-voting.git
cd decentralized-voting

npm install

npx hardhat test

ALCHEMY_API_URL=https://eth-sepolia.g.alchemy.com/v2/<API_KEY>
PRIVATE_KEY=0xabc123...

npx hardhat run scripts/deploy.js --network sepolia

