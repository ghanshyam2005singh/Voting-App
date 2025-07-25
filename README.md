# 🗳️ Onchain Voting App

A fully onchain voting dApp for transparent, auditable, and immutable voting—built on the Base network.

---

## 🚀 Demo

[Live Demo](https://your-deployed-app.vercel.app)

---

## 🧠 Features

- Connect wallet using RainbowKit
- Vote for proposals stored onchain (Base Goerli/Base Mainnet)
- View real-time vote counts
- Prevent double voting (1 vote per address)
- All data is fully onchain and verifiable
- Clean UI with TailwindCSS

---

## 🛠️ Tech Stack

| Layer       | Technology                     |
|-------------|-------------------------------|
| Frontend    | Next.js + TailwindCSS         |
| Blockchain  | Solidity + Foundry            |
| Wallet      | RainbowKit + Wagmi + viem     |
| Backend     | Onchain only (no server)      |
| Deployment  | Vercel (frontend), Base chain |

---

## 📦 Project Structure

```
onchain-voting-app/
├── contracts/           # Solidity smart contracts (Foundry)
│   └── src/Voting.sol
├── frontend/            # Next.js app
│   ├── app/
│   ├── components/
│   ├── constants/contract.ts
│   └── wagmi-config.ts
├── scripts/             # Deployment scripts
├── .env                 # API keys & config
└── README.md
```

---

## 🔗 Smart Contract

**Voting.sol**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    struct Proposal {
        string name;
        uint voteCount;
    }

    address public owner;
    mapping(address => bool) public hasVoted;
    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        owner = msg.sender;
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal(proposalNames[i], 0));
        }
    }

    function vote(uint proposalIndex) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(proposalIndex < proposals.length, "Invalid proposal");
        proposals[proposalIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getProposals() external view returns (Proposal[] memory) {
        return proposals;
    }

    function totalProposals() external view returns (uint) {
        return proposals.length;
    }
}
```

---

## 🧪 Local Development

### 1. Prerequisites

- [Node.js](https://nodejs.org/)
- [Foundry](https://book.getfoundry.sh/)
- [MetaMask](https://metamask.io/)
- [Base Goerli Faucet](https://faucet.quicknode.com/base/base-goerli)

### 2. Clone & Install

```bash
git clone https://github.com/your-username/onchain-voting-app.git
cd onchain-voting-app
cd frontend
npm install
```

### 3. Deploy Smart Contract

```bash
cd ../contracts
forge build
forge script script/Deploy.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```
> Use [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/) for RPC.

### 4. Configure Frontend

Edit `frontend/constants/contract.ts`:
```ts
export const VOTING_CONTRACT_ADDRESS = "0xYourDeployedContractAddress";
```

### 5. Run Frontend

```bash
cd ../frontend
npm run dev
```
> App runs at [http://localhost:3000](http://localhost:3000)

---

## ⚙️ Environment Variables

Create `.env.local` in `/frontend`:

```
NEXT_PUBLIC_CONTRACT_ADDRESS=0xYourContract
NEXT_PUBLIC_CHAIN_ID=84531 # For Base Goerli
```

---

## 🌍 Network Info

- **Testnet:** Base Goerli (Chain ID: `84531`)
- **Mainnet:** Base (Chain ID: `8453`)

---

## 🔐 Security

- 1 vote per address (enforced onchain)
- All data is fully onchain and verifiable

---

## 🏗️ Deployment

Deploy frontend to Vercel:

```bash
cd frontend
npx vercel login
npx vercel --prod
```

---

## 🤝 Contributing

Pull requests welcome! For new features or ideas, open an issue first.

---

## 🏆 Built For

[Onchain Summer Awards 2025](https://onchainsummer.xyz)

---

## 👤 Author

- Name: Ghanshyam Singh
- Twitter: [@https_ghanshyam](https://twitter.com/https_ghanshyam)
- GitHub: [@ghanshyam2005singh](https://github.com/ghanshyam2005singh)

---

## 📄 License

MIT License. Do whatever you want.