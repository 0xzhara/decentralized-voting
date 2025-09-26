const { expect } = require("chai");

describe("Voting", function () {
  let Voting, voting;

  beforeEach(async function () {
    Voting = await ethers.getContractFactory("Voting");
    voting = await Voting.deploy();
    await voting.deployed();
  });

  it("should create a proposal", async function () {
    await voting.createProposal("Proposal 1");
    const proposal = await voting.getProposal(1);
    expect(proposal[0]).to.equal("Proposal 1");
    expect(proposal[1]).to.equal(0);
  });

  it("should allow voting", async function () {
    await voting.createProposal("Proposal 2");
    await voting.vote(1);
    const proposal = await voting.getProposal(1);
    expect(proposal[1]).to.equal(1);
  });

  it("should prevent double voting", async function () {
    await voting.createProposal("Proposal 3");
    await voting.vote(1);
    await expect(voting.vote(1)).to.be.revertedWith("Sudah vote");
  });
});
