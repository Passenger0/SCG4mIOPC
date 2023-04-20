// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveSendProductStatus = false;
  
  bool isActiveSendTransportOrder = false;
  
  bool isActiveSendReceipt = false;
  
  bool isActiveSendConfirmation = false;
  
  bool isActiveSendProductOrder = false;
  
  bool isActiveSendDeliveryInfo = false;
  
  bool isActiveSendDeliveryRequest = false;
  
  bool isActiveSendDeclarationRequest = false;
  
  bool isActiveSendTurnSupplierOrder = false;
  
  bool isActiveSendDeclarationForm = false;
  
  bool isActiveSendDeliveryOrder = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveSendProductOrder = true;    //协作起点置为true
  }


  function SendProductStatus() external {
    if (isActiveSendProductStatus) {
        emit next("", "", "ReceiveProductStatus");
    }
        isActiveSendDeliveryOrder = true;
  }

  function SendTransportOrder() external {
    if (isActiveSendTransportOrder) {
          emit next("", "", "ReceiveTransportOrder");
    }
  }

  function SendReceipt() external {
    if (isActiveSendReceipt) {
          isEnabledReceiveReceipt = true;
          ReceiveReceipt();
    }
  }

  function ReceiveTransportOrder() public {
    if (isEnabledReceiveTransportOrder) {
        emit next("", "", "ReceiveTransportOrder");
    }
          isActiveSendDeliveryRequest = true;
  }

  function ReceiveProductOrder() public {
    if (isEnabledReceiveProductOrder) {
        emit next("", "", "ReceiveProductOrder");
    }
          isActiveSendSupplierOrder = true;
  }

  function SendSupplierOrder() external {
    if (isActiveSendSupplierOrder) {
          isEnabledReceiveSupplierOrder = true;
          ReceiveSupplierOrder();
    }
          isActiveReceiveReceipt = true;
  }

  function ReceiveDeliveryInfo() public {
    if (isEnabledReceiveDeliveryInfo) {
        emit next("", "", "ReceiveDeliveryInfo");
    }
          isActiveSendDeclarationRequest = true;
          isActiveSendConfirmation = true;
  }

  function ReceiveConfirmation() public {
    if (isEnabledReceiveConfirmation) {
        emit next("", "", "ReceiveConfirmation");
    }
  }

  function ReceiveSupplierOrder() public {
    if (isEnabledReceiveSupplierOrder) {
        emit next("", "", "ReceiveSupplierOrder");
    }
          isActiveSendTransportOrder = true;
          isActiveSendTurnSupplierOrder = true;
  }

  function SendConfirmation() external {
    if (isActiveSendConfirmation) {
          isEnabledReceiveConfirmation = true;
          ReceiveConfirmation();
    }
          isActiveSendReceipt = true;
          isActiveSendDeclarationRequest = true;
  }

  function SendProductOrder() external {
    if (isActiveSendProductOrder) {
          isEnabledReceiveProductOrder = true;
          ReceiveProductOrder();
    }
          isActiveReceiveProductStatus = true;
  }

  function ReceiveProductStatus() public {
    if (isEnabledReceiveProductStatus) {
        emit next("", "", "ReceiveProductStatus");
    }
          isActiveReceiveDeliveryOrder = true;
  }

  function ReceiveDeliveryRequest() public {
    if (isEnabledReceiveDeliveryRequest) {
        emit next("", "", "ReceiveDeliveryRequest");
    }
          isActiveSendDeliveryInfo = true;
  }

  function SendDeliveryInfo() external {
    if (isActiveSendDeliveryInfo) {
          isEnabledReceiveDeliveryInfo = true;
          ReceiveDeliveryInfo();
    }
          isActiveReceiveDeclarationRequest = true;
          isActiveReceiveConfirmation = true;
  }

  function SendDeliveryRequest() external {
    if (isActiveSendDeliveryRequest) {
          isEnabledReceiveDeliveryRequest = true;
          ReceiveDeliveryRequest();
    }
          isActiveReceiveDeliveryInfo = true;
  }

  function ReceiveReceipt() public {
    if (isEnabledReceiveReceipt) {
        emit next("", "", "ReceiveReceipt");
    }
          isActiveSendProductStatus = true;
  }

  function SendDeclarationRequest() external {
    if (isActiveSendDeclarationRequest) {
          isEnabledReceiveDeclarationRequest = true;
          ReceiveDeclarationRequest();
    }
          isActiveReceiveDeclarationForm = true;
          isActiveSendConfirmation = true;
  }

  function SendTurnSupplierOrder() external {
    if (isActiveSendTurnSupplierOrder) {
          isEnabledReceiveTurnSupplierOrder = true;
          ReceiveTurnSupplierOrder();
    }
  }

  function ReceiveTurnSupplierOrder() public {
    if (isEnabledReceiveTurnSupplierOrder) {
        emit next("", "", "ReceiveTurnSupplierOrder");
    }
          isActiveReceiveDeliveryRequest = true;
  }

  function ReceiveDeclarationRequest() public {
    if (isEnabledReceiveDeclarationRequest) {
        emit next("", "", "ReceiveDeclarationRequest");
    }
          isActiveSendDeclarationForm = true;
          isActiveReceiveConfirmation = true;
  }

  function SendDeclarationForm() external {
    if (isActiveSendDeclarationForm) {
          isEnabledReceiveDeclarationForm = true;
          ReceiveDeclarationForm();
    }
  }

  function ReceiveDeclarationForm() public {
    if (isEnabledReceiveDeclarationForm) {
        emit next("", "", "ReceiveDeclarationForm");
    }
          isActiveSendReceipt = true;
  }

  function ReceiveDeliveryOrder() public {
    if (isEnabledReceiveDeliveryOrder) {
        emit next("", "", "ReceiveDeliveryOrder");
    }
  }

  function SendDeliveryOrder() external {
    if (isActiveSendDeliveryOrder) {
          isEnabledReceiveDeliveryOrder = true;
          ReceiveDeliveryOrder();
    }
  }

}
