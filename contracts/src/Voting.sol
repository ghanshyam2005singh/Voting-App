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
