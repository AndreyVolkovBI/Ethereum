pragma solidity ^0.4.21;

/**
  Election contract:
  1. Add candidates
  2. Verify voters
  3. Vote for particular candidate
  4. Count all the votes

  @author Andrey Volkov
*/
contract Election {

  struct Candidate {
    string name;
    uint voteCount;
  }

  struct Voter {
    bool authorized;
    bool voted;
    uint vote;
  }

  // owner of the contract, can add candidates and verify voters
  address public owner;
  string public electionName;

  // mapping of all voters
  mapping(address => Voter) public voters;
  // list of avaliable candidates
  Candidate[] public candidates;
  uint public totalVotes;

  // modifier that requiers to make operations on behalf of the owner
  modifier ownerOnly() {
    require(msg.sender == owner);
    _;
  }

  // creates election contract with owner and election name
  constructor(string _electionName) public {
    owner = msg.sender;
    electionName = _electionName;
  }

  function addCAndidate(string _name) ownerOnly public {
    candidates.push(Candidate(_name, 0));
  }

  function getCandidatesCount() public view returns(uint) {
    return candidates.length;
  }

  function authorize(address _person) ownerOnly public {
    voters[_person].authorized = true;
  }

  function vote(uint _voteIndex) public {
    // make sure not voted yet
    require(!voters[msg.sender].voted);
    // is voter authorized and allowed to vote
    require(voters[msg.sender].authorized);

    voters[msg.sender].vote = _voteIndex;
    voters[msg.sender].voted = true;

    candidates[_voteIndex].voteCount += 1;
    totalVotes += 1;
  }

  // once called by the owner the contract is destruct
  function end() ownerOnly public {
    selfdestruct(owner);
  }
}
