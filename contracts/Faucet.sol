// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
  address[] public funders;

  receive() external payable {}

  function addFunds() external payable {
    bool existentFunder = false;

    for (uint256 index = 0; index < funders.length; index++) {
      if(msg.sender == funders[index]) {
        existentFunder = true;
      }
    }

    if(!existentFunder) {
      funders.push(msg.sender);
    }
  }

  function getFunders() external view returns(address[] memory) {
    return funders;
  }
}