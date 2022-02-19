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

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

import "./interfaces/IUniswapV2Router.sol";

contract MBFStaking is Ownable, ReentrancyGuard {
    using EnumerableSet for EnumerableSet.UintSet;

    struct UserStaking {
        address account;
        uint256 steps;
        uint256 stakingId;
        uint256 startDate;
        uint256 unstakeDate;
        uint256 amount;
        uint256 shares;
    }

    struct Settings {
        uint256 LATE_PENALTY_RATE_PER_STEP; // 1
        uint256 BASE_BONUS_STEPS; // 30
        uint256 MAX_STAKE_STEPS; // 1820
        uint256 MAX_LATE_STEPS; // 28
        uint256 STEP_SECONDS; // 86400
        uint256 BURN_PENALTY_RATE; // 5
    }

    event Stake(
        address indexed account,
        address caller,
        uint256 steps,
        uint256 startDate,
        uint256 indexed stakingId,
        uint256 indexed shares,
        uint256 amount,
        uint256 daysBonus,
        uint256 totalStaked,
        uint256 totalUnstaked,
        uint256 totalStakedShares,
        uint256 totalUnstakedShares
    );

    event Unstake(
        address indexed account,
        uint256 unstakeDate,
        uint256 indexed stakingId,
        uint256 indexed payoutMBF,
        uint256 penaltyRate,
        uint256 penaltyMBF,
        uint256 totalStaked,
        uint256 totalUnstaked,
        uint256 totalStakedShares,
        uint256 totalUnstakedShares
    );

    event UpdateSettings(bytes32 indexed setting, uint256 indexed newValue, address indexed caller);

    // SETTINGS
    Settings public SETTINGS;

    IERC20 mbfToken;
    IERC20 busd;

    // states
    uint256 public totalStaked;
    uint256 public totalUnstaked;

    uint256 public totalPaidBUSD;

    uint256 public totalStakedShares;
    uint256 public totalUnstakedShares;

    uint256 public currentStakingId;

    IUniswapV2Router02 public swapRouter;

    // stakingId => UserStaking
    mapping(uint256 => UserStaking) public userStakingOf;

    // account => stakingId[]
    mapping(address => EnumerableSet.UintSet) private stakingIdsOf;

    constructor(
        IERC20 _mbfToken,
        IERC20 _busd,
        IUniswapV2Router02 _router,
        uint256 _latePenaltyRatePerStep,
        uint256 _maxStakeSteps,
        uint256 _maxLateSteps,
        uint256 _baseBonusSteps,
        uint256 _stepSeconds,
        uint256 _burnPenaltyRate
    ) {
        mbfToken = _mbfToken;
        busd = _busd;
        swapRouter = _router;

        SETTINGS.STEP_SECONDS = _stepSeconds;
        SETTINGS.MAX_STAKE_STEPS = _maxStakeSteps;
        SETTINGS.MAX_LATE_STEPS = _maxLateSteps;
        SETTINGS.LATE_PENALTY_RATE_PER_STEP = _latePenaltyRatePerStep;
        SETTINGS.BASE_BONUS_STEPS = _baseBonusSteps;
        SETTINGS.BURN_PENALTY_RATE = _burnPenaltyRate;

        mbfToken.approve(address(swapRouter), type(uint256).max);
    }

    function setLatePenaltyRatePerStep(uint256 _rate) external onlyOwner {
        SETTINGS.LATE_PENALTY_RATE_PER_STEP = _rate;
        emit UpdateSettings("LATE_PENALTY_RATE_PER_STEP", _rate, msg.sender);
    }

    function setBaseBonusSteps(uint256 _steps) external onlyOwner {
        SETTINGS.BASE_BONUS_STEPS = _steps;
        emit UpdateSettings("BASE_BONUS_STEPS", _steps, msg.sender);
    }

    function setMaxStakeSteps(uint256 _steps) external onlyOwner {
        SETTINGS.MAX_STAKE_STEPS = _steps;
        emit UpdateSettings("MAX_STAKE_STEPS", _steps, msg.sender);
    }

    function setMaxLateSteps(uint256 _steps) external onlyOwner {
        SETTINGS.MAX_LATE_STEPS = _steps;
        emit UpdateSettings("MAX_LATE_STEPS", _steps, msg.sender);
    }

    function setBurnPenaltyRate(uint256 _rate) external onlyOwner {
        SETTINGS.BURN_PENALTY_RATE = _rate;
        emit UpdateSettings("BURN_PENALTY_RATE", _rate, msg.sender);
    }

    function stake(uint256 _stakeSteps, uint256 _amount) external nonReentrant {
        require(_stakeSteps > 0, "MBFStaking[stake]: _stakeSteps <= 0");
        require(_amount > 0, "MBFStaking[stake]: _amount <= 0");
        require(_stakeSteps <= SETTINGS.MAX_STAKE_STEPS, "Staking[stake]: _stakeSteps > SETTINGS.MAX_STAKE_STEPS");
        require(mbfToken.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");

        address userAccount = msg.sender;
        (uint256 shares, uint256 daysBonus) = getShares(_stakeSteps, _amount);
        uint256 startDate = block.timestamp;

        // state - update
        uint256 stakingId = currentStakingId;
        userStakingOf[currentStakingId] = UserStaking({
            account: userAccount,
            steps: _stakeSteps,
            stakingId: stakingId,
            startDate: startDate,
            unstakeDate: 0,
            amount: _amount,
            shares: shares
        });
        stakingIdsOf[userAccount].add(currentStakingId);

        totalStaked = totalStaked + _amount;
        totalStakedShares = totalStakedShares + shares;

        currentStakingId++;

        // [event]
        emit Stake(
            userAccount,
            msg.sender,
            _stakeSteps,
            startDate,
            stakingId,
            shares,
            _amount,
            daysBonus,
            totalStaked,
            totalUnstaked,
            totalStakedShares,
            totalUnstakedShares
        );
    }

    function unstake(uint256 stakingId) external nonReentrant {
        UserStaking storage userStaking = userStakingOf[stakingId];
        address userAccount = msg.sender;

        require(userStaking.account == userAccount, "MBFStaking[unstake]: userStaking.account != userAccount");
        require(userStaking.unstakeDate == 0, "MBFStaking[unstake]: userStaking.unstakeDate != 0");

        uint256 busdBalance = busd.balanceOf(address(this));
        uint256 sharesLeft = totalStakedShares - totalUnstakedShares;
        uint256 fullStakedBusdBonus = (busdBalance * userStaking.shares) / sharesLeft;

        uint256 actualStakeSteps = getActualSteps(userStaking.startDate);
        uint256 penaltyRateWei = getPenaltyRateWei(userStaking.startDate, userStaking.steps);
        uint256 rateMBFToGetBack = uint256(1e18) - penaltyRateWei;

        uint256 payoutMBF = (userStaking.amount * rateMBFToGetBack) / 1e18;
        uint256 penaltyMBF = userStaking.amount - payoutMBF;

        // state - update
        uint256 unstakeDate = block.timestamp;
        userStaking.unstakeDate = unstakeDate;

        totalUnstaked = totalUnstaked + userStaking.amount;
        totalUnstakedShares = totalUnstakedShares + userStaking.shares;
        totalPaidBUSD = totalPaidBUSD + fullStakedBusdBonus;

        if (payoutMBF > 0) {
            require(mbfToken.transfer(msg.sender, payoutMBF), "Token transfer failed");
        }

        if (actualStakeSteps >= userStaking.steps) {
            uint256 payoutBUSD = (fullStakedBusdBonus * rateMBFToGetBack) / 1e18;
            require(busd.transfer(msg.sender, payoutBUSD), "Token transfer failed");
        }

        if (penaltyMBF > 0) {
            // Swap penaltyMBF with busd
            _swapTokensForUSD(penaltyMBF);
        }

        // [event]
        emit Unstake(
            userAccount,
            unstakeDate,
            userStaking.stakingId,
            payoutMBF,
            penaltyRateWei,
            penaltyMBF,
            totalStaked,
            totalUnstaked,
            totalStakedShares,
            totalUnstakedShares
        );
    }

    /*
     * 100% = 1e18
     */
    function getPenaltyRateWei(uint256 _startDate, uint256 expectedSteps) public view returns (uint256) {
        uint256 actualSteps = getActualSteps(_startDate);

        // no penalty
        if (actualSteps == expectedSteps) {
            return 0;
        }

        // early penalty
        if (actualSteps < expectedSteps) {
            return ((expectedSteps - actualSteps) * 1e18) / expectedSteps;
        }

        // late penalty
        uint256 lateSteps = actualSteps - expectedSteps;

        if (lateSteps <= SETTINGS.MAX_LATE_STEPS) {
            return 0;
        }
        uint256 penaltyLateSteps = lateSteps - SETTINGS.MAX_LATE_STEPS;

        uint256 latePenalty = (penaltyLateSteps * 1e16) / SETTINGS.LATE_PENALTY_RATE_PER_STEP;

        if (latePenalty > 1e18) {
            return 1e18;
        }

        return latePenalty;
    }

    function getActualSteps(uint256 _startDate) public view returns (uint256) {
        return (block.timestamp - _startDate) / SETTINGS.STEP_SECONDS;
    }

    function getShares(uint256 _stakeSteps, uint256 _amount) public view returns (uint256 shares, uint256 daysBonus) {
        uint256 base = _stakeSteps * _amount;
        daysBonus = getDaysBonus(_stakeSteps);
        shares = (base * daysBonus) / 1e18;
    }

    function getDaysBonus(uint256 _stakeSteps) public view returns (uint256) {
        uint256 bonusScore = (_stakeSteps * 1e9) / SETTINGS.BASE_BONUS_STEPS;
        uint256 bonusBase = bonusScore + 100e9;

        return (bonusBase * bonusBase) / 1e18;
    }

    function getUserStakingCount(address _account) external view returns (uint256) {
        return stakingIdsOf[_account].length();
    }

    function getUserStakingId(address _account, uint256 idx) external view returns (uint256) {
        return stakingIdsOf[_account].at(idx);
    }

    function _swapTokensForUSD(uint256 tokenAmount) internal {
        // generate the uniswap pair path of token -> bnb -> busd
        address[] memory path = new address[](3);
        path[0] = address(mbfToken);
        path[1] = swapRouter.WETH();
        path[2] = address(busd);

        // make the swap
        swapRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of busd
            path,
            address(this), // send to stableWallet
            block.timestamp
        );
    }
}
