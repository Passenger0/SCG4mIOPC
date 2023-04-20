// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveReceiveDecoration = false;
  bool isEnabledReceiveDecoration = false;
  
  bool isActiveSendDecorationsRequest = false;
  
  bool isActiveReceiveCake = false;
  bool isEnabledReceiveCake = false;
  
  bool isActiveCakePreparation = false;
  bool isEnabledCakePreparation = false;
  
  bool isActiveSendCake = false;
  
  bool isActiveAssignLayers = false;
  
  bool isActiveSendCakeRequest = false;
  
  bool isActiveLayerPreparation = false;
  bool isEnabledLayerPreparation = false;
  
  bool isActiveSendDecoratedLayer = false;
  
  bool isActiveReceiveAndCombineLayer = false;
  bool isEnabledReceiveAndCombineLayer = false;
  
  bool isActiveReceiveDecorations = false;
  bool isEnabledReceiveDecorations = false;
  
  bool isActiveAssignDecoration = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveSendCakeRequest = true;    //协作起点置为true
  }


  function ReceiveDecoration() public {
    if (isEnabledReceiveDecoration) {
        emit next("", "", "ReceiveDecoration");
    }
          isActiveSendDecoratedLayer = true;
  }

  function SendDecorationsRequest() external {
    if (isActiveSendDecorationsRequest) {
          isEnabledReceiveDecorations = true;
          ReceiveDecorations();
    }
          isActiveReceiveCake = true;
  }

  function ReceiveCake() public {
    if (isEnabledReceiveCake) {
        emit next("", "", "ReceiveCake");
    }
  }

  function CakePreparation() public {
    if (isEnabledCakePreparation) {
        emit next("", "", "CakePreparation");
    }
          isActiveAssignLayers = true;
  }

  function SendCake() external {
    if (isActiveSendCake) {
          isEnabledReceiveCake = true;
          ReceiveCake();
    }
  }

  function AssignLayers() external {
    if (isActiveAssignLayers) {
          isEnabledLayerPreparation = true;
          LayerPreparation();
    }
          isActiveReceiveDecorations = true;
  }

  function SendCakeRequest() external {
    if (isActiveSendCakeRequest) {
          isEnabledCakePreparation = true;
          CakePreparation();
    }
          isActiveSendDecorationsRequest = true;
  }

  function LayerPreparation() public {
    if (isEnabledLayerPreparation) {
        emit next("", "", "LayerPreparation");
    }
          isActiveReceiveDecoration = true;
  }

  function SendDecoratedLayer() external {
    if (isActiveSendDecoratedLayer) {
          isEnabledReceiveAndCombineLayer = true;
          ReceiveAndCombineLayer();
    }
  }

  function ReceiveAndCombineLayer() public {
    if (isEnabledReceiveAndCombineLayer) {
        emit next("", "", "ReceiveAndCombineLayer");
    }
          isActiveSendCake = true;
  }

  function ReceiveDecorations() public {
    if (isEnabledReceiveDecorations) {
        emit next("", "", "ReceiveDecorations");
    }
          isActiveAssignDecoration = true;
  }

  function AssignDecoration() external {
    if (isActiveAssignDecoration) {
          isEnabledReceiveDecoration = true;
          ReceiveDecoration();
    }
          isActiveReceiveAndCombineLayer = true;
  }

}
