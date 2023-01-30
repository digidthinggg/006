// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Layer.sol";

contract Wallet {
  using Layer for Layer.LayerAPI;

  struct AmountMinMax {
    uint256 min;
    uint256 max;
  }

  struct Requirement {
    AmountMinMax amount;
    string[] tokensArr;
    uint256[][] layerFlow;
  }

  struct Transfer {
    uint256 transferNum;
    address receiver;
    uint256 amount;
    Requirement[] layers;
    bool executed;
  }

  // Pending transfers.
  Transfer[] transferQueue;


  // Temp.
  event LogLayerEV(bool started, bool success, bool failure);

  event HandleLayerStartedEV();
  event HandleLayerSuccessEV();
  event HandleLayerFailureEV();


  // buildChainlinkRequest similar
  function test() public virtual {
    buildLayer();
  }

  function testInitTransferRequirements() private {
    //
  }

  function buildLayer(
  ) internal virtual returns (Layer.LayerAPI memory) {
    Layer.LayerAPI memory layer;
    layer.init();
    emit LogLayerEV(layer.started, layer.success, layer.failure);
    // Log to check how it's returned.
  }

  function handleLayerStarted() external {
    emit HandleLayerStartedEV();
  }

  function handleLayerSuccess() external {
    // dispatchNext
    emit HandleLayerSuccessEV();
  }

  function handleLayerFailure() external {
    emit HandleLayerFailureEV();
  }

  function executeTransfer() private {
    //
  }
}
