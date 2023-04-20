// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveSendDeclarationForm = false;
  
  bool isActiveReceiveSupplierOrder = false;
  bool isEnabledReceiveSupplierOrder = false;
  
  bool isActiveSendTurnSupplierOrder = false;
  
  bool isActiveReceiveTurnSupplierOrder = false;
  bool isEnabledReceiveTurnSupplierOrder = false;
  
  bool isActiveReceiveDeliveryRequest = false;
  bool isEnabledReceiveDeliveryRequest = false;
  
  bool isActiveReceiveDeliveryOrder = false;
  bool isEnabledReceiveDeliveryOrder = false;
  
  bool isActiveSendDeliveryRequest = false;
  
  bool isActiveReceiveDeclarationRequest = false;
  bool isEnabledReceiveDeclarationRequest = false;
  
  bool isActiveReceiveReceipt = false;
  bool isEnabledReceiveReceipt = false;
  
  bool isActiveReceiveConfirmation = false;
  bool isEnabledReceiveConfirmation = false;
  
  bool isActiveSendTransportOrder = false;
  
  bool isActiveSendReceipt = false;
  
  bool isActiveReceiveTransportOrder = false;
  bool isEnabledReceiveTransportOrder = false;
  
  bool isActiveSendDeliveryInfo = false;
  
  bool isActiveSendSupplierOrder = false;
  
  bool isActiveSendDeclarationRequest = false;
  
  bool isActiveSendProductStatus = false;
  
  bool isActiveSendConfirmation = false;
  
  bool isActiveSendProductOrder = false;
  
  bool isActiveReceiveProductOrder = false;
  bool isEnabledReceiveProductOrder = false;
  
  bool isActiveReceiveDeliveryInfo = false;
  bool isEnabledReceiveDeliveryInfo = false;
  
  bool isActiveReceiveDeclarationForm = false;
  bool isEnabledReceiveDeclarationForm = false;
  
  bool isActiveSendDeliveryOrder = false;
  
  bool isActiveReceiveProductStatus = false;
  bool isEnabledReceiveProductStatus = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveSendProductOrder = true;    //协作起点置为true
  }


  function SendDeclarationForm() external {
      if (isActiveSendDeclarationForm) {
        emit next("", "", "SendDeclarationForm");
          isEnabledReceiveDeclarationForm = true;
      }
  }

  function ReceiveSupplierOrder() public {
    if (isEnabledReceiveSupplierOrder && isActiveReceiveSupplierOrder) {
        emit next("", "", "ReceiveSupplierOrder");
    }
          isActiveSendTransportOrder = true;
          isActiveSendTurnSupplierOrder = true;
  }

  function SendTurnSupplierOrder() external {
      if (isActiveSendTurnSupplierOrder) {
        emit next("", "", "SendTurnSupplierOrder");
          isEnabledReceiveTurnSupplierOrder = true;
      }
  }

  function ReceiveTurnSupplierOrder() public {
    if (isEnabledReceiveTurnSupplierOrder && isActiveReceiveTurnSupplierOrder) {
        emit next("", "", "ReceiveTurnSupplierOrder");
    }
          isActiveReceiveDeliveryRequest = true;
  }

  function ReceiveDeliveryRequest() public {
    if (isEnabledReceiveDeliveryRequest && isActiveReceiveDeliveryRequest) {
        emit next("", "", "ReceiveDeliveryRequest");
    }
          isActiveSendDeliveryInfo = true;
  }

  function ReceiveDeliveryOrder() public {
    if (isEnabledReceiveDeliveryOrder && isActiveReceiveDeliveryOrder) {
        emit next("", "", "ReceiveDeliveryOrder");
    }
  }

  function SendDeliveryRequest() external {
      if (isActiveSendDeliveryRequest) {
        emit next("", "", "SendDeliveryRequest");
          isEnabledReceiveDeliveryRequest = true;
      }
          isActiveReceiveDeliveryInfo = true;
  }

  function ReceiveDeclarationRequest() public {
    if (isEnabledReceiveDeclarationRequest && isActiveReceiveDeclarationRequest) {
        emit next("", "", "ReceiveDeclarationRequest");
    }
          isActiveSendDeclarationForm = true;
          isActiveReceiveConfirmation = true;
  }

  function ReceiveReceipt() public {
    if (isEnabledReceiveReceipt && isActiveReceiveReceipt) {
        emit next("", "", "ReceiveReceipt");
    }
          isActiveSendProductStatus = true;
  }

  function ReceiveConf isActiveReceiveConfirmation = true;
  }

  function SendDeliveryOrder() external {
      if (isActiveSendDeliveryOrder) {
        emit next("", "", "SendDeliveryOrder");
          isEnabledReceiveDeliveryOrder = true;
      }
  }

  function SendTransportOrder() external {
      if (isActiveSendTransportOrder) {
        emit next("", "", "SendTransportOrder");
          isEnabledReceiveTransportOrder = true;
      }
  }

  function SendTurnSupplierOrder() external {
      if (isActiveSendTurnSupplierOrder) {
        emit next("", "", "SendTurnSupplierOrder");
          isEnabledReceiveTurnSupplierOrder = true;
      }
  }

  function ReceiveProductOrder() public {
    if (isEnabledReceiveProductOrder && isActiveReceiveProductOrder) {
        emit next("", "", "ReceiveProductOrder");
    }
          isActiveSendSupplierOrder = true;
  }

  function ReceiveDeliveryInfo() public {
    if (isEnabledReceiveDeliveryInfo && isActiveReceiveDeliveryInfo) {
        emit next("", "", "ReceiveDeliveryInfo");
    }
          isActiveSendDeclarationRequest = true;
          isActiveSendConfirmation = true;
  }

  function SendConfirmation() external {
      if (isActiveSendConfirmation) {
        emit next("", "", "SendConfirmation");
          isEnabledReceiveConfirmation = true;
      }
          isActiveSendReceipt = true;
          isActiveSendDeclarationRequest = true;
  }

  function SendReceipt() external {
      if (isActiveSendReceipt) {
        emit next("", "", "SendReceipt");
          isEnabledReceiveReceipt = true;
      }
  }

  function ReceiveDeliveryRequest() public {
    if (isEnabledReceiveDeliveryRequest && isActiveReceiveDeliveryRequest) {
        emit next("", "", "ReceiveDeliveryRequest");
    }
          isActiveSendDeliveryInfo = true;
  }

  function ReceiveTransportOrder() public {
    if (isEnabledReceiveTransportOrder && isActiveReceiveTransportOrder) {
        emit next("", "", "ReceiveTransportOrder");
    }
          isActiveSendDeliveryRequest = true;
  }

  function SendDeclarationForm() external {
      if (isActiveSendDeclarationForm) {
        emit next("", "", "SendDeclarationForm");
          isEnabledReceiveDeclarationForm = true;
      }
  }

  function SendDeclarationRequest() external {
      if (isActiveSendDeclarationRequest) {
        emit next("", "", "SendDeclarationRequest");
          isEnabledReceiveDeclarationRequest = true;
      }
          isActiveReceiveDeclarationForm = true;
          isActiveSendConfirmation = true;
  }

  function ReceiveDeclarationForm() public {
    if (isEnabledReceiveDeclarationForm && isActiveReceiveDeclarationForm) {
        emit next("", "", "ReceiveDeclarationForm");
    }
          isActiveSendReceipt = true;
  }

  function SendProductOrder() external {
      if (isActiveSendProductOrder) {
        emit next("", "", "SendProductOrder");
          isEnabledReceiveProductOrder = true;
      }
          isActiveReceiveProductStatus = true;
  }

  function ReceiveProductStatus() public {
    if (isEnabledReceiveProductStatus && isActiveReceiveProductStatus) {
        emit next("", "", "ReceiveProductStatus");
    }
          isActiveReceiveDeliveryOrder = true;
  }

  function ReceiveDeliveryOrder() public {
    if (isEnabledReceiveDeliveryOrder && isActiveReceiveDeliveryOrder) {
        emit next("", "", "ReceiveDeliveryOrder");
    }
  }

}