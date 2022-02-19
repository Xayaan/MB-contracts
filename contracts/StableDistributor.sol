// Copyright © 2021 Moon Bear Finance Ltd. All Rights Reserved.
// SPDX-License-Identifier: GPL-3.0
//
// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░
// ░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░
// ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░
// ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░
// ░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓███▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░
// ░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█████▓████▓▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒░░░░░░
// ░░░░░░▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▓███████████▓▓▒▒▒▒▒▒▒░░░░░▒▒▒▒▒░░░░░
// ░░░░░▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒█████████████▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░
// ░░░░▒▒▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▓▓▓███████████████▓▒▒▒▒▒▒░▒▒▒▒▒▒░░░░
// ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████████████████▓▒▒▒▒▒▒▒▒▒▒▒▒░░░░
// ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░
// ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓██████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░
// ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓███████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░
// ░░░░▒▒▒░░░░▒▒▒▒▒████████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░
// ░░░░░▒▒▒▒▒▒▒▒▒▒▒████████████████████████████▒▒▒▒▒▒▒▒▒▒▒░░░░░
// ░░░░░▒▒▒▒▒▒▒▒▒▒▒█████████▓▓█████████▓▓▓█████▒▒▒▒▒▒▒▒▒▒▒░░░░░
// ░░░░░░▒▒▒▒▒▒▒▒▒▒██████▓▒▒▒▒▓█████▓▓▒▒▒▓█████▒▒▒▒▒▒▒▒▒▒░░░░░░
// ░░░░░░░▒▒▒▒▒▒▒▒▒██████▓▓▓▓▓██████▓▓▓▓▓▓█████▒▒▒▒▒▒▒▒▒░░░░░░░
// ░░░░░░░░░▒▓▓▓██████████████████████████████████▓▓▓▒▒░░░░░░░░
// ░░░░░░░░░░▓██████████████████████████████████████▓░░░░░░░░░░
// ░░░░░░░░░░░▒▓██████████████████████████████████▓▒░░░░░░░░░░░
// ░░░░░░░░░░░░░░▒▓████████████████████████████▓▒░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░░░▒▒▓▓████████████████████▓▓▒▒░░░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░░░░░░░░▒▒▓▓▓▓██████▓▓▓▓▒▒░░░░░░░░░░░░░░░░░░░░░
// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import { DistributeIterableMapping } from "./libs/DistributeIterableMapping.sol";

contract StableDistributor is Ownable, ReentrancyGuard {
    using DistributeIterableMapping for DistributeIterableMapping.Map;

    DistributeIterableMapping.Map private members;

    uint256 public totalAllocation; // Default: 1000: 100%, 10: 1%

    IERC20 public token; // ERC20 token address
    address public baseAccount; // Base Account: (total - member amounts) will be distributed to this account

    uint256 public totalReleased; // Amount of token (sent to members)
    uint256 public totalDistributed; // Amount of token (cumulative)
    uint256 public allocationSum; // Sum of member allocation (should be less than or equal to 1000)

    uint256 public lastDistributedTimeStamp;

    event DistributeWalletCreated(address indexed addr, address indexed baseAccount);
    event DistributeBaseAccountChanged(address indexed baseAccount);
    event DistributeMemberAdded(address indexed member, uint256 allocation);
    event DistributeMemberRemoved(address indexed member);
    event TokenDistributed(uint256 amount);
    event TokenReleased(address indexed member, uint256 amount);
    event DistributeMemberAddressChanged(address indexed oldAddr, address indexed newAddr);
    event DistributeMemberAllocationChanged(address indexed member, uint256 newAllocation);

    constructor(IERC20 _token, address _baseAccount) {
        require(_baseAccount != address(0), "BaseAccount can't be empty address");
        require(address(_token) != address(0), "Token address can't be empty address");
        token = _token;
        baseAccount = _baseAccount;

        members.set(baseAccount, DistributeIterableMapping.DistributeMember(baseAccount, 0, 0, 0));

        lastDistributedTimeStamp = block.timestamp;
        totalAllocation = 1000;

        emit DistributeWalletCreated(address(this), baseAccount);
    }

    function getTotalMembers() external view returns (uint256) {
        return members.size();
    }

    function getMemberInfo(address _member)
        external
        view
        returns (
            address,
            uint256,
            uint256,
            uint256
        )
    {
        require(members.inserted[_member], "Member doesn't exist!");
        DistributeIterableMapping.DistributeMember storage member = members.get(_member);

        if (_member == baseAccount) {
            // baseAccount
            return (member.addr, 1000 - allocationSum, member.pending, member.totalReleased);
        }

        return (member.addr, member.allocation, member.pending, member.totalReleased);
    }

    function getMemberInfoAtIndex(uint256 memberIndex)
        external
        view
        returns (
            address,
            uint256,
            uint256,
            uint256
        )
    {
        require(memberIndex < members.size(), "MemberIndex invalid!");
        address memberAddress = members.getKeyAtIndex(memberIndex);
        require(members.inserted[memberAddress], "Member doesn't exist!");
        DistributeIterableMapping.DistributeMember storage member = members.get(memberAddress);

        if (memberIndex == 0) {
            // baseAccount
            return (member.addr, 1000 - allocationSum, member.pending, member.totalReleased);
        }

        return (member.addr, member.allocation, member.pending, member.totalReleased);
    }

    function getReleasableAmount(address member) external view returns (uint256) {
        require(members.inserted[member], "Member doesn't exist!");
        uint256 pendingAmount = token.balanceOf(address(this)) + totalReleased - totalDistributed;
        if (member == baseAccount) {
            return members.get(member).pending + (pendingAmount * (totalAllocation - allocationSum)) / totalAllocation;
        } else {
            return members.get(member).pending + (pendingAmount * members.get(member).allocation) / totalAllocation;
        }
    }

    // msg.sender is member and trying to change address
    function updateMemberAddress(address newAddr) external {
        address member = msg.sender;
        require(newAddr != address(0), "New address can't be a ZERO address!");
        require(members.inserted[member], "You're not a member!");
        require(!members.inserted[newAddr], "NewAddr already exist!");

        members.set(
            newAddr,
            DistributeIterableMapping.DistributeMember(
                newAddr,
                members.get(member).allocation,
                members.get(member).pending,
                0
            )
        );

        members.remove(member);

        emit DistributeMemberAddressChanged(member, newAddr);
    }

    // admin changes allocation of a member
    function updateMemberAllocation(address member, uint256 allocation) external onlyOwner {
        require(allocation > 0, "Allocation can't be ZERO!");
        require(members.inserted[member], "Member is not a member!");

        allocationSum = allocationSum + allocation - members.get(member).allocation;

        require(allocationSum <= totalAllocation, "Allocation is too big!");

        updatePendingAmounts();

        members.get(member).allocation = allocation;

        emit DistributeMemberAllocationChanged(member, allocation);
    }

    function _release(address _member) private nonReentrant {
        require(members.inserted[_member], "Member doesn't exist!");
        DistributeIterableMapping.DistributeMember storage member = members.get(_member);
        uint256 pendingAmount = member.pending;
        if (pendingAmount > 0) {
            member.totalReleased = member.totalReleased + pendingAmount;
            member.pending = 0;
            totalReleased = totalReleased + pendingAmount;
            token.transfer(_member, pendingAmount);
        }
        emit TokenReleased(_member, pendingAmount);
    }

    function updatePendingAmounts() public {
        if (lastDistributedTimeStamp < block.timestamp) {
            uint256 pendingAmount = token.balanceOf(address(this)) + totalReleased - totalDistributed;
            if (pendingAmount > 0) {
                // updatePendingAmounts to members, and restAmount to baseAccount
                uint256 distributedAmount = 0;
                uint256 memberLength = members.size();
                for (uint256 index = 1; index < memberLength; index++) {
                    address memberAddress = members.getKeyAtIndex(index);
                    DistributeIterableMapping.DistributeMember storage member = members.get(memberAddress);
                    uint256 amount = (pendingAmount * member.allocation) / totalAllocation;
                    member.pending = member.pending + amount;
                    distributedAmount = distributedAmount + amount;
                }

                DistributeIterableMapping.DistributeMember storage baseMember = members.get(baseAccount);
                uint256 restAmount = pendingAmount - distributedAmount;
                baseMember.pending = baseMember.pending + restAmount;

                totalDistributed = totalDistributed + pendingAmount;
            }
            lastDistributedTimeStamp = block.timestamp;
        }
    }

    function addMember(address _member, uint256 _allocation) external onlyOwner {
        require(_member != address(0), "Member address can't be empty address");
        require(!members.inserted[_member], "Member already exist!");
        require(_allocation > 0, "Allocation can't be zero!");
        allocationSum = allocationSum + _allocation;
        require(allocationSum <= totalAllocation, "Allocation is too big!");
        // updatePendingAmounts current pending tokens to existing members and then add new member
        updatePendingAmounts();
        members.set(_member, DistributeIterableMapping.DistributeMember(_member, _allocation, 0, 0));
        emit DistributeMemberAdded(_member, _allocation);
    }

    function removeMember(address _member) external onlyOwner {
        require(_member != baseAccount, "You can't remove baseAccount!");
        require(members.inserted[_member], "Member doesn't exist!");
        // updatePendingAmounts pending Amount to members and send necessary amount to that member, and then remove
        updatePendingAmounts();
        _release(_member);
        allocationSum = allocationSum - members.get(_member).allocation;
        members.remove(_member);

        emit DistributeMemberRemoved(_member);
    }

    function release() external {
        // updatePendingAmounts pendingAmount first and release
        updatePendingAmounts();
        _release(msg.sender);
    }

    function releaseToMember(address member) external {
        // updatePendingAmounts pendingAmount first and release
        updatePendingAmounts();
        _release(member);
    }

    function releaseToMemberAll() external onlyOwner {
        updatePendingAmounts();

        uint256 memberLength = members.size();
        for (uint256 index = 0; index < memberLength; index++) {
            address memberAddress = members.getKeyAtIndex(index);
            _release(memberAddress);
        }
    }
}
