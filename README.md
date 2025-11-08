# 🔗 EVM Token Bridge

A lightweight **EVM-to-EVM token bridge** that enables secure transfer of tokens across chains using a **Lock → Mint → Burn → Unlock** mechanism.  
Built with Solidity, OpenZeppelin, and a role-gated relayer model for secure message passing.

---

## ✨ Features

- 🔒 **Lock & Unlock** tokens on the canonical chain  
- 🪙 **Mint & Burn** wrapped tokens on the destination chain  
- 🚫 **Replay-protected** message execution  
- 🧑‍⚖️ **Role-based access** for relayers + admins  
- ⏸️ **Pausable & Secure** (Reentrancy-safe)  
- ✅ Works for any ERC-20 token  

---

## 🧠 How It Works

| Chain A (Source) | Chain B (Destination) |
|------------------|------------------------|
| User deposits tokens → locked in bridge | Relayer mints wrapped tokens to recipient |
| Later: User burns wrapped tokens | Relayer releases original locked tokens |

---

## 🏗️ Architecture

Contracts included:

| Contract | Role |
|----------|-------|
| `INR.sol` | ERC-20 canonical token on source chain |
| `WINR.sol` | Wrapped token on destination chain |
| `BridgeBase.sol` | Core bridging logic (shared) |
| `BridgeETH.sol` | Implementation for both sides (mintable or lockable) |

---
