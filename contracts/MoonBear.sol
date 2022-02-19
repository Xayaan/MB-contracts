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
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";

import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IUniswapV2Router.sol";

contract MoonBear is IERC20, Initializable, ContextUpgradeable, OwnableUpgradeable {
    using EnumerableSet for EnumerableSet.AddressSet;
    using SafeERC20 for IERC20;

    /*** Storage Properties ***/

    uint256 private constant BASEPOINT = 1000;
    address private constant DEAD_WALLET = 0x000000000000000000000000000000000000dEaD;

    string public constant name = "MoonBear.finance";
    string public constant symbol = "MBF";
    uint256 public constant decimals = 9;

    mapping(address => uint256) private rOwned;
    mapping(address => uint256) private tOwned;
    mapping(address => mapping(address => uint256)) private allowances;

    mapping(address => bool) public isExcludedFromFee;
    mapping(address => bool) public isExcludedFromReward;
    address[] private excluded;

    address public stableWallet;
    address public buybackWallet;

    uint256 public burnFee;
    uint256 public reflectionFee;
    uint256 public liquidityFee;
    uint256 public buybackFee;
    uint256 public stableFee;

    uint256 private tTotal;
    uint256 private rTotal;
    uint256 private tFeeTotal;

    uint256 public maxTxAmount;
    uint256 public numTokensSellToAddToLiquidity;
    uint256 public buybackAmount;

    uint256 private launchedAt;

    bool public swapAndLiquifyEnabled;
    bool public buybackEnabled;
    bool public paused;

    address public bnbPair;
    address public busdPair;
    address public busd;
    IUniswapV2Router02 public swapRouter;

    uint256 public lockedTimeBetweenSwap;
    mapping(address => uint256) private _addressToLastSwapTime;

    mapping(address => bool) public isExcludedFromMaxTxLimit;
    mapping(address => bool) public saleContracts;

    bool private backdatedReflections;

    mapping(address => bool) public taxWhitelist;

    uint256 public minAmountSellTX;

    mapping(address => bool) public hotWallets;

    modifier validLockTime(address sender, address recipient) {
        if (lockedTimeBetweenSwap != 0 && sender == bnbPair && recipient != owner()) {
            uint256 lastSwapTime = _addressToLastSwapTime[recipient];
            require(
                block.timestamp - lastSwapTime >= lockedTimeBetweenSwap,
                "Lock time has not been released from last swap"
            );
            _addressToLastSwapTime[recipient] = block.timestamp;
        }
        _;
    }

    /*** Contract Logic  ***/

    function initialize(IUniswapV2Router02 _router, address _busd) external initializer {
        ContextUpgradeable.__Context_init();
        OwnableUpgradeable.__Ownable_init();

        tTotal = 1000000000000 * 10**9; // 1,000,000,000,000 MBF supply
        rTotal = (type(uint256).max / tTotal) * tTotal;

        // Initial tax configuration (18% fee on sell only)
        burnFee = 20; // 2% BNB for burn
        reflectionFee = 20; // 2% BNB for reflection
        liquidityFee = 20; // 2% BNB for liquidity
        buybackFee = 20; // 2% BNB for buyback
        stableFee = 100; // 10% BUSD (3% dev/marketing, 3% staking, 2% charity, 2% team)

        // Initial token configuration (n.b. this can be altered with subsequent TXs as we grow)
        maxTxAmount = 1000000000 * 10**9; // 1,000,000,000 MBF max buy per TX (0.1% of supply)
        numTokensSellToAddToLiquidity = 10000000 * 10**9; // 10,000,000 MBF min token before liquidity (0.001% of supply)
        buybackAmount = 1 * 10**17; // 0.1 BNB min before buyback

        swapAndLiquifyEnabled = true;
        buybackEnabled = true;

        rOwned[_msgSender()] = rTotal;

        // Exclude owner and this contract from fee
        isExcludedFromFee[owner()] = true;
        isExcludedFromFee[address(this)] = true;

        // Default buyback wallet
        buybackWallet = DEAD_WALLET;

        // Initial locked time between swaps (seconds)
        lockedTimeBetweenSwap = 60;

        // Create a uniswap pair for this new token
        swapRouter = _router;
        busd = _busd;
        bnbPair = IUniswapV2Factory(_router.factory()).createPair(address(this), _router.WETH());
        busdPair = IUniswapV2Factory(_router.factory()).createPair(address(this), _busd);

        _approve(address(this), address(swapRouter), type(uint256).max);

        emit Transfer(address(0), _msgSender(), tTotal);
    }

    /*** ERC20 Standard Public Getters, Effects & Interactions Functions ***/

    function totalSupply() public view override returns (uint256) {
        return tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (isExcludedFromReward[account]) return tOwned[account];
        return tokenFromReflection(rOwned[account]);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        uint256 currentAllowance = allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);

        return true;
    }

    /*** Owner Functions ***/

    function pause() external onlyOwner {
        require(!paused, "!paused");
        paused = true;
    }

    function unpause() external onlyOwner {
        require(paused, "paused");
        paused = false;
    }

    function excludeFromReward(address account) external onlyOwner {
        require(!isExcludedFromReward[account], "Account is already excluded");
        require(excluded.length < 30, "Too long length of excluded");

        if (rOwned[account] > 0) {
            tOwned[account] = tokenFromReflection(rOwned[account]);
        }
        isExcludedFromReward[account] = true;
        excluded.push(account);
    }

    function includeInReward(address account) external onlyOwner {
        require(isExcludedFromReward[account], "Account is already included");
        for (uint256 i = 0; i < excluded.length; i++) {
            if (excluded[i] == account) {
                excluded[i] = excluded[excluded.length - 1];
                tOwned[account] = 0;
                isExcludedFromReward[account] = false;
                excluded.pop();
                break;
            }
        }
    }

    function excludeFromFee(address account) external onlyOwner {
        require(!isExcludedFromFee[account], "Account is already excluded");
        isExcludedFromFee[account] = true;
    }

    function includeInFee(address account) external onlyOwner {
        require(isExcludedFromFee[account], "Account is already included");
        isExcludedFromFee[account] = false;
    }

    function excludeFromMaxTxLimit(address account) external onlyOwner {
        require(!isExcludedFromMaxTxLimit[account], "Account is already excluded");
        isExcludedFromMaxTxLimit[account] = true;
    }

    function includeInMaxTxLimit(address account) external onlyOwner {
        require(isExcludedFromMaxTxLimit[account], "Account is already included");
        isExcludedFromMaxTxLimit[account] = false;
    }

    function setSaleContract(address sale, bool isTrue) external onlyOwner {
        saleContracts[sale] = isTrue;
    }

    function setBurnPercent(uint256 _burnFee) external onlyOwner {
        burnFee = _burnFee;
    }

    function setReflectionPercent(uint256 _reflectionFee) external onlyOwner {
        reflectionFee = _reflectionFee;
    }

    function setLiquidityFeePercent(uint256 _liquidityFee) external onlyOwner {
        liquidityFee = _liquidityFee;
    }

    function setBuyBackFeePercent(uint256 _buybackFee) external onlyOwner {
        buybackFee = _buybackFee;
    }

    function setStableFeePercent(uint256 _stableFee) external onlyOwner {
        stableFee = _stableFee;
    }

    function setNumTokensSellToAddToLiquidity(uint256 _numTokensSellToAddToLiquidity) external onlyOwner {
        numTokensSellToAddToLiquidity = _numTokensSellToAddToLiquidity;
    }

    function setMaxTxPercent(uint256 maxTxPercent) external onlyOwner {
        maxTxAmount = (tTotal * maxTxPercent) / 10**2;
    }

    function setMinAmountSellTX(uint256 _minAmountSellTX) external onlyOwner {
        minAmountSellTX = _minAmountSellTX;
    }

    function setSwapAndLiquifyEnabled(bool enabled) external onlyOwner {
        swapAndLiquifyEnabled = enabled;
    }

    function setBuybackEnabled(bool enabled) external onlyOwner {
        buybackEnabled = enabled;
    }

    function setBuybackAmount(uint256 _buybackAmount) external onlyOwner {
        buybackAmount = _buybackAmount;
    }

    function setRouterAndPairs(
        IUniswapV2Router02 router,
        address _bnbPair,
        address _busdPair,
        address _busd
    ) external onlyOwner {
        if (address(swapRouter) != address(0)) {
            _approve(address(this), address(swapRouter), 0);
        }

        swapRouter = router;
        bnbPair = _bnbPair;
        busdPair = _busdPair;
        busd = _busd;

        _approve(address(this), address(swapRouter), type(uint256).max);
    }

    function setStableWallet(address _stableWallet) external onlyOwner {
        require(stableWallet != _stableWallet, "Same address already set");
        stableWallet = _stableWallet;
    }

    function setBuybackWallet(address _buybackWallet) external onlyOwner {
        require(buybackWallet != _buybackWallet, "Same address already set");
        buybackWallet = _buybackWallet;
    }

    function setLockTimeBetweenSwap(uint256 seconds_) external onlyOwner {
        lockedTimeBetweenSwap = seconds_;
    }

    function withdrawLP(address _to) external onlyOwner {
        IERC20(bnbPair).safeTransfer(_to, IERC20(bnbPair).balanceOf(address(this)));
    }

    function reflectBackDated() external onlyOwner {
        require(backdatedReflections == false);
        backdatedReflections = true;
        rTotal = rTotal - tokenToReflection(tFeeTotal);
    }

    function addToHotWallets(address[] calldata accounts) external onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            hotWallets[accounts[i]] = true;
        }
    }

    function removeFromHotWallets(address[] calldata accounts) external onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            hotWallets[accounts[i]] = false;
        }
    }

    function addToTaxWhitelist(address[] calldata accounts) external onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            taxWhitelist[accounts[i]] = true;
        }
    }

    function removeFromTaxWhitelist(address[] calldata accounts) external onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            taxWhitelist[accounts[i]] = false;
        }
    }

    /*** View Functions ***/

    function totalFees() public view returns (uint256) {
        return tFeeTotal;
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns (uint256) {
        require(tAmount <= tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            (uint256 rAmount, , , , , ) = _getValues(tAmount);
            return rAmount;
        } else {
            (, uint256 rTransferAmount, , , , ) = _getValues(tAmount);
            return rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 rAmount) public view returns (uint256) {
        require(rAmount <= rTotal, "Amount must be less than total reflections");
        uint256 currentRate = _getRate();
        return rAmount / currentRate;
    }

    function tokenToReflection(uint256 tAmount) public view returns (uint256) {
        require(tAmount <= tTotal, "Amount must be less than total supply");
        uint256 currentRate = _getRate();
        return tAmount * currentRate;
    }

    /*** Public Effects & Interactions Functions ***/

    function deliver(uint256 tAmount) external {
        address sender = _msgSender();
        require(!isExcludedFromReward[sender], "Excluded addresses cannot call this function");
        (uint256 rAmount, , , , , ) = _getValues(tAmount);
        rOwned[sender] = rOwned[sender] - rAmount;
        rTotal = rTotal - rAmount;
        tFeeTotal = tFeeTotal + tAmount;
    }

    /*** Internal Functions ***/

    function _getValues(uint256 tAmount)
        internal
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getTValues(tAmount);
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, _getRate());
        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity);
    }

    function _getTValues(uint256 tAmount)
        internal
        view
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = (tAmount * (burnFee + reflectionFee)) / BASEPOINT;
        uint256 tLiquidity =
            (tAmount *
                (
                    launchedAt >= block.number
                        ? BASEPOINT - burnFee - reflectionFee - 10
                        : buybackFee + liquidityFee + stableFee
                )) / BASEPOINT;
        uint256 tTransferAmount = tAmount - tFee - tLiquidity;
        return (tTransferAmount, tFee, tLiquidity);
    }

    function _getRValues(
        uint256 tAmount,
        uint256 tFee,
        uint256 tLiquidity,
        uint256 currentRate
    )
        internal
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount * currentRate;
        uint256 rFee = tFee * currentRate;
        uint256 rLiquidity = tLiquidity * currentRate;
        uint256 rTransferAmount = rAmount - rFee - rLiquidity;
        return (rAmount, rTransferAmount, rFee);
    }

    function _getRate() internal view returns (uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply / tSupply;
    }

    function _getCurrentSupply() internal view returns (uint256, uint256) {
        uint256 rSupply = rTotal;
        uint256 tSupply = tTotal;
        for (uint256 i = 0; i < excluded.length; i++) {
            if (rOwned[excluded[i]] > rSupply || tOwned[excluded[i]] > tSupply) return (rTotal, tTotal);
            rSupply = rSupply - rOwned[excluded[i]];
            tSupply = tSupply - tOwned[excluded[i]];
        }
        if (rSupply < rTotal / tTotal) return (rTotal, tTotal);
        return (rSupply, tSupply);
    }

    function _burnAndReflectFee(uint256 rFee, uint256 tFee) internal {
        uint256 denominator = burnFee + reflectionFee;
        // burn
        tTotal = tTotal - (tFee * burnFee) / denominator;
        // reflect
        rTotal = rTotal - rFee;
        tFeeTotal = tFeeTotal + (tFee * reflectionFee) / denominator;
    }

    function _takeLiquidityAndBuybackAndStableSwap(uint256 tLiquidity) internal {
        uint256 currentRate = _getRate();
        uint256 rLiquidity = tLiquidity * currentRate;
        rOwned[address(this)] = rOwned[address(this)] + rLiquidity;
        if (isExcludedFromReward[address(this)]) tOwned[address(this)] = tOwned[address(this)] + tLiquidity;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal validLockTime(from, to) {
        require(from != address(0) && to != address(0), "ERC20: transfer from or to the zero address");

        if (from != owner() && to != owner()) {
            require(!paused, "Paused!");
            if (!isExcludedFromMaxTxLimit[from]) {
                require(amount <= maxTxAmount, "Transfer amount exceeds the maxTxAmount.");
            }
        }

        if (launchedAt == 0 && to == bnbPair) {
            _launch();
        }

        // if sell
        if (to == bnbPair || to == busdPair) {
            require(amount >= minAmountSellTX, "Transfer amount is too small.");

            if (from != bnbPair && from != busdPair && from != address(this) && !saleContracts[from]) {
                _swapAndLiquify();
                _buyback();
            }
        }

        if (_shouldTakeFee(from, to)) {
            _transferNormal(from, to, amount);
        } else {
            _transferNoFee(from, to, amount);
        }
    }

    function _launch() internal {
        launchedAt = block.number;
        paused = false;
    }

    function _shouldTakeFee(address from, address to) internal returns (bool) {
        // no fee for owner, sale contract and mbf contract(for liquidation and buyback)
        if (
            from == owner() ||
            from == address(this) ||
            hotWallets[from] ||
            hotWallets[to] ||
            saleContracts[from] == true ||
            to == owner() ||
            to == address(this)
        ) {
            return false;
        }

        // if sell
        if (to == bnbPair || to == busdPair) {
            taxWhitelist[from] = true;
            // not excluded from sell fee
            if (!isExcludedFromFee[from]) {
                return true;
            }
        }

        // if to in tax whitelist
        if (taxWhitelist[to]) {
            return false;
        }

        // first buy
        if (from == bnbPair || from == busdPair) {
            taxWhitelist[to] = true;
            return false;
        }

        return true;
    }

    function _transferNoFee(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        // Calculate like transferStandard, but where tFee = 0
        uint256 currentRate = _getRate();
        uint256 rAmount = tAmount * currentRate;

        if (isExcludedFromReward[sender]) {
            tOwned[sender] = tOwned[sender] - tAmount;
        }
        rOwned[sender] = rOwned[sender] - rAmount;
        if (isExcludedFromReward[recipient]) {
            tOwned[recipient] = tOwned[recipient] + tAmount;
        }
        rOwned[recipient] = rOwned[recipient] + rAmount;
        emit Transfer(sender, recipient, tAmount);
    }

    function _transferNormal(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getValues(tAmount);
        if (isExcludedFromReward[sender]) {
            tOwned[sender] = tOwned[sender] - tAmount;
        }
        rOwned[sender] = rOwned[sender] - rAmount;
        if (isExcludedFromReward[recipient]) {
            tOwned[recipient] = tOwned[recipient] + tTransferAmount;
        }
        rOwned[recipient] = rOwned[recipient] + rTransferAmount;

        _takeLiquidityAndBuybackAndStableSwap(tLiquidity);
        _burnAndReflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _swapAndLiquify() internal {
        uint256 contractTokenBalance = balanceOf(address(this));

        if (contractTokenBalance > maxTxAmount) {
            contractTokenBalance = maxTxAmount;
        }

        if (
            !swapAndLiquifyEnabled || contractTokenBalance < numTokensSellToAddToLiquidity || stableWallet == address(0)
        ) {
            return;
        }

        uint256 halfOfLiquidifyFee = liquidityFee / 2;
        uint256 busdSwapBalance = (numTokensSellToAddToLiquidity * stableFee) / (liquidityFee + stableFee + buybackFee);
        uint256 amountLeft = numTokensSellToAddToLiquidity - busdSwapBalance;
        uint256 bnbSwapBalance = (amountLeft * (halfOfLiquidifyFee + buybackFee)) / (liquidityFee + buybackFee);
        amountLeft = amountLeft - bnbSwapBalance;

        _swapTokensForUSD(busdSwapBalance);
        uint256 ethBefore = address(this).balance;
        _swapTokensForEth(bnbSwapBalance);
        uint256 ethSwaped = address(this).balance - ethBefore;
        _addLiquidityEth(amountLeft, (ethSwaped * halfOfLiquidifyFee) / (halfOfLiquidifyFee + buybackFee));
    }

    function _buyback() internal {
        if (!buybackEnabled || address(this).balance < buybackAmount) {
            return;
        }

        _swapETHForTokens(buybackAmount);
    }

    function _swapTokensForEth(uint256 tokenAmount) internal {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = swapRouter.WETH();

        // make the swap
        swapRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of bnb
            path,
            address(this),
            block.timestamp
        );
    }

    function _swapTokensForUSD(uint256 tokenAmount) internal {
        // generate the uniswap pair path of token -> bnb -> busd
        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = swapRouter.WETH();
        path[2] = busd;

        // make the swap
        swapRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of busd
            path,
            stableWallet, // send to stableWallet
            block.timestamp
        );
    }

    function _swapETHForTokens(uint256 amount) internal {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = swapRouter.WETH();
        path[1] = address(this);

        uint256 beforeSwap = balanceOf(address(this));
        // make the swap
        swapRouter.swapExactETHForTokensSupportingFeeOnTransferTokens{ value: amount }(
            0, // accept any amount of Tokens
            path,
            buybackWallet, // Burn address
            block.timestamp
        );
        uint256 outcome = balanceOf(address(this)) - beforeSwap;

        if (buybackWallet == DEAD_WALLET) {
            uint256 tAmount = tokenFromReflection(outcome);
            tTotal = tTotal - tAmount;
        }
    }

    function _addLiquidityEth(uint256 tokenAmount, uint256 ethAmount) internal {
        // add the liquidity
        swapRouter.addLiquidityETH{ value: ethAmount }(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            address(this),
            block.timestamp
        );
    }

    /*** Ether Receive Fallback ***/

    // to recieve ETH from swaping
    receive() external payable {}
}
