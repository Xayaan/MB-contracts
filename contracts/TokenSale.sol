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

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MoonBearTokenSale is Ownable {
    using SafeERC20 for IERC20;

    uint32 public constant week = 7 days;
    uint256 public constant PRICE_DECIMAL = 1e9;

    uint256 public softcap;
    uint256 public hardcap;
    uint256 public salePrice;
    address public token;
    uint256 public tokensSold;
    uint256 public tokenSaleDuration;
    uint256 public startTime;

    bool public released = false;
    address payable public wallet;

    bool public whitelistEnabled = true;

    mapping(address => uint256) private _balances;
    mapping(address => uint256) private _purchasedTokens;
    mapping(address => bool) private _whitelist;

    uint256 public maxBuyAmount;

    struct ReleaseScheduleItem {
        uint256 percent;
        uint256 unlockTime;
    }

    ReleaseScheduleItem[] public releaseSchedule;

    /**
     * Event for token purchase logging
     * @param purchaser who paid for the tokens
     * @param beneficiary who got the tokens
     * @param value weis paid for purchase
     * @param amount amount of tokens purchased
     */
    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);
    event TokensWithdrawn(address indexed withdrawer, uint256 amount);
    event StartChanged(uint256 newStartDate);
    event TokenSaleDurationChanged(uint256 newDuration);
    event WhitelistEnabled(bool enabled);

    modifier ongoingSale() {
        require(block.timestamp >= startTime && block.timestamp <= tokenSaleEndTime(), "Sale: not selling now");
        _;
    }

    modifier afterRelease() {
        require(released || block.timestamp >= tokenSaleEndTime() + 3 days, "Sale: not released yet");
        _;
    }

    modifier softcapReached() {
        require(isSoftcapReached(), "Sale: softcap not reached");
        _;
    }

    /**
     * @notice Create token sale contracts with initial params. After creation init functions must be called
     * @param _token Address of token to sale
     * @param _softcap Minium amount of sold token to finish the sale
     * @param _hardcap Amount of tokens to sell
     * @param _salePrice BNB per token, multiplied by PRICE_DECIMAL
     * @param _startTime Token sale start time in unix seconds
     * @param _tokenSaleDuration token sale duration
     * @param _maxPurchaseAmount Max amount of tokens to buy
     */
    constructor(
        address _token,
        uint256 _softcap,
        uint256 _hardcap,
        uint256 _salePrice,
        uint256 _startTime,
        uint256 _tokenSaleDuration,
        uint256 _maxPurchaseAmount
    ) {
        require(_startTime > block.timestamp, "invalid start time");
        require(_token != address(0), "zero token address");
        require(_softcap > 0, "softcap must not be zero");
        require(_hardcap > 0, "hardcap not be zero");
        require(_hardcap > _softcap, "hardcap must be bigger or equal to softcap");
        require(_salePrice > 0, "sale price must not be zero");
        require(_tokenSaleDuration > 0, "sale duration not be zero");
        require(_maxPurchaseAmount > 0, "maxPurchaseAmount must be greather than zero");

        token = _token;
        softcap = _softcap;
        hardcap = _hardcap;
        salePrice = _salePrice;
        startTime = _startTime;
        tokenSaleDuration = _tokenSaleDuration;
        wallet = payable(msg.sender);

        maxBuyAmount = calculatePurchaseAmount(_maxPurchaseAmount);

        //vesting config
        _setReleaseSchedule();
    }

    /**
     * @notice Token sale end time in unix seconds
     */
    function tokenSaleEndTime() public view returns (uint256) {
        return startTime + tokenSaleDuration;
    }

    /**
     * set releaseSchedule
     */
    function _setReleaseSchedule() private {
        uint256 saleEnd = tokenSaleEndTime();

        if (releaseSchedule.length == 0) {
            releaseSchedule.push(ReleaseScheduleItem(20, saleEnd));
            releaseSchedule.push(ReleaseScheduleItem(40, saleEnd + 1 * week));
            releaseSchedule.push(ReleaseScheduleItem(60, saleEnd + 2 * week));
            releaseSchedule.push(ReleaseScheduleItem(80, saleEnd + 3 * week));
            releaseSchedule.push(ReleaseScheduleItem(100, saleEnd + 4 * week));
        } else {
            releaseSchedule[0].unlockTime = saleEnd;
            releaseSchedule[1].unlockTime = saleEnd + week;
            releaseSchedule[2].unlockTime = saleEnd + 2 * week;
            releaseSchedule[3].unlockTime = saleEnd + 3 * week;
            releaseSchedule[4].unlockTime = saleEnd + 4 * week;
        }
    }

    /**
     * @notice Buy tokens
     * @param beneficiary Address of account token can be withdrawn to after sale
     */
    function buyTokens(address beneficiary) external payable ongoingSale returns (bool) {
        require(beneficiary != address(0), "Sale: to the zero address");
        require(!whitelistEnabled || _whitelist[msg.sender], "Sale: whitelist");

        // 0.05 interval
        require(msg.value % (5 * 1e16) == 0, "Amount should be 0.05 BNB interval");

        uint256 amount = calculatePurchaseAmount(msg.value);
        require(amount != 0, "Sale: amount is 0");
        require(amount + tokensSold <= hardcap, "Sale: hardcap reached");

        tokensSold = tokensSold + amount;
        _balances[beneficiary] = _balances[beneficiary] + amount;
        require(_balances[beneficiary] <= maxBuyAmount, "Sale: amount exceeds max");
        _purchasedTokens[beneficiary] = _purchasedTokens[beneficiary] + amount;

        emit TokensPurchased(_msgSender(), beneficiary, msg.value, amount);
        return true;
    }

    function convertTo18Decimal(uint256 amount) private pure returns (uint256) {
        return amount * 1e9;
    }

    function convertFrom18Decimal(uint256 amount) private pure returns (uint256) {
        return amount / 1e9;
    }

    /**
     * @notice Calculates amount of tokens to be bought for given bnb
     * @param purchaseAmountWei amount in wei
     * @return amount of tokens that can be bought for given purchaseAmountInWei
     */
    function calculatePurchaseAmount(uint256 purchaseAmountWei) public view returns (uint256) {
        return convertFrom18Decimal((purchaseAmountWei * PRICE_DECIMAL) / salePrice);
    }

    /**
     * @notice Amount of tokens that can be withdrawn (locked and unlocked)
     * @param account Address of account to query balance
     * @return the balance of purchased tokens of an account.
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    /**
     * @return the amount of purchased tokens of an account.
     */
    function tokensPurchased(address account) public view returns (uint256) {
        return _purchasedTokens[account];
    }

    /**
     * @return true if the address in whitelist
     */
    function isWhitelisted(address account) public view returns (bool) {
        return _whitelist[account];
    }

    function isSoftcapReached() public view returns (bool) {
        return tokensSold >= softcap;
    }

    /**
     * @notice Withdraw bought tokens
     */
    function withdrawTokens(uint256 amount) external afterRelease softcapReached {
        require(amount <= _balances[msg.sender], "Sale: insufficient balance");
        require(amount <= withdrawableBalance(msg.sender), "Sale: locked");
        _balances[msg.sender] = _balances[msg.sender] - amount;
        IERC20(token).safeTransfer(msg.sender, amount);
        emit TokensWithdrawn(msg.sender, amount);
    }

    /**
     * @notice amount of tokens available to withdraw at current time
     * @param user Address of account
     */
    function withdrawableBalance(address user) public view returns (uint256) {
        uint256 purchasedAmount = _purchasedTokens[user];

        for (uint256 i = releaseSchedule.length; i > 0; i--) {
            if (releaseSchedule[i - 1].unlockTime < block.timestamp) {
                uint256 lockedAmount = (purchasedAmount * (100 - releaseSchedule[i - 1].percent)) / 100;
                return _balances[user] - lockedAmount;
            }
        }
        return 0; //fallback value
    }

    function withdrawBNBWhenFailed() external afterRelease {
        require(isSoftcapReached() == false, "Sale: not failed");
        require(_balances[msg.sender] > 0, "Sale: nothing to withdraw");

        uint256 bnbAmount = (convertTo18Decimal(_balances[msg.sender]) * salePrice) / PRICE_DECIMAL;
        _balances[msg.sender] = 0;

        (bool res, ) = payable(msg.sender).call{ value: bnbAmount }("");
        require(res, "transfer failed");
    }

    function enableWhitelist(bool _enabled) external onlyOwner {
        require(whitelistEnabled != _enabled, "Sale: already enabled or disabled");
        whitelistEnabled = _enabled;
        emit WhitelistEnabled(_enabled);
    }

    function changeSaleStart(uint256 _startTime) external onlyOwner {
        require(block.timestamp < startTime, "Sale: started");
        startTime = _startTime;
        emit StartChanged(startTime);
    }

    function changeSaleDuration(uint256 _saleDuration) external onlyOwner {
        require(block.timestamp <= tokenSaleEndTime(), "Sale: ended");
        tokenSaleDuration = _saleDuration;
        emit TokenSaleDurationChanged(startTime);
    }

    function addToWhitelist(address[] calldata _accounts) external onlyOwner {
        for (uint256 i = 0; i < _accounts.length; ++i) {
            if (!_whitelist[_accounts[i]]) {
                _whitelist[_accounts[i]] = true;
            }
        }
    }

    function removeFromWhitelist(address[] calldata _accounts) external onlyOwner {
        for (uint256 i = 0; i < _accounts.length; ++i) {
            if (_whitelist[_accounts[i]]) {
                _whitelist[_accounts[i]] = false;
            }
        }
    }

    function release() external onlyOwner {
        require(block.timestamp >= tokenSaleEndTime(), "Sale: not ended");
        require(IERC20(token).balanceOf(address(this)) >= hardcap, "Sale: not enough token to release");

        released = true;
    }

    function withdrawBnb() external onlyOwner {
        withdrawBnbPartially(address(this).balance);
    }

    function withdrawNotSoldTokens() external onlyOwner {
        require(block.timestamp >= tokenSaleEndTime(), "Sale: only after sale");
        uint256 balance = IERC20(token).balanceOf(address(this));
        IERC20(token).safeTransfer(wallet, balance - tokensSold);
    }

    /**
     * Withdraw bnb from the sale contract after sale is ended
     * param amount amount to withdraw
     */
    function withdrawBnbPartially(uint256 amount) public onlyOwner {
        (bool res, ) = wallet.call{ value: amount }("");
        require(res, "transfer failed");
    }

    function changeWallet(address _to) public onlyOwner {
        require(_to != address(0), "change wallet: to the zero address");
        wallet = payable(_to);
    }

    /**
     * Update EndTime
     * _endTime == 0 : close with current block.timestamp
     */
    function setEndTime(uint256 _endTime) external onlyOwner {
        if (_endTime == 0) {
            require(block.timestamp > startTime, "You can't end");

            tokenSaleDuration = block.timestamp - startTime;
        } else {
            require(block.timestamp < _endTime, "EndTime can't be past time");
            require(_endTime > startTime, "endTime should be greater than startTime");

            tokenSaleDuration = _endTime - startTime;
        }

        _setReleaseSchedule();
    }

    function setTokenAddress(address _token) external onlyOwner {
        require(_token != address(0), "zero token address");

        token = _token;
    }

    function updateMaxPurchaseAmount(uint256 _maxPurchaseAmount) external onlyOwner {
        require(_maxPurchaseAmount > 0, "maxPurchaseAmount must be greather than zero");
        maxBuyAmount = calculatePurchaseAmount(_maxPurchaseAmount);
    }

    function updateHardcap(uint256 _hardcap) external onlyOwner {
        require(_hardcap >= tokensSold, "hardcap must be bigger or equal to tokensSold");
        require(softcap <= _hardcap, "hardcap must be bigger or equal to softcap");
        hardcap = _hardcap;
    }

    function updateSoftcap(uint256 _softcap) external onlyOwner {
        require(_softcap <= hardcap, "hardcap must be bigger or equal to softcap");
        require(_softcap > 0, "softcap must not be zero");
        softcap = _softcap;
    }
}
