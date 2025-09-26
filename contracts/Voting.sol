// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Decentralized Voting System
/// @author ...
/// @notice Kontrak voting sederhana yang memungkinkan pembuatan proposal & voting transparan
contract Voting {
    struct Proposal {
        uint256 id;
        string description;
        uint256 voteCount;
        bool exists;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    uint256 public proposalCount;

    event ProposalCreated(uint256 id, string description);
    event Voted(uint256 proposalId, address voter);

    /// @notice Membuat proposal baru
    /// @param description Deskripsi proposal
    function createProposal(string memory description) public {
        proposalCount++;
        proposals[proposalCount] = Proposal(proposalCount, description, 0, true);

        emit ProposalCreated(proposalCount, description);
    }

    /// @notice Vote untuk proposal tertentu
    /// @param proposalId ID proposal
    function vote(uint256 proposalId) public {
        require(proposals[proposalId].exists, "Proposal tidak ada");
        require(!hasVoted[proposalId][msg.sender], "Sudah vote");

        proposals[proposalId].voteCount++;
        hasVoted[proposalId][msg.sender] = true;

        emit Voted(proposalId, msg.sender);
    }

    /// @notice Mendapatkan detail proposal
    function getProposal(uint256 proposalId) public view returns (string memory, uint256) {
        require(proposals[proposalId].exists, "Proposal tidak ada");
        Proposal storage proposal = proposals[proposalId];
        return (proposal.description, proposal.voteCount);
    }
}
