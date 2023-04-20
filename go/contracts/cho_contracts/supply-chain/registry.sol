// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {
    version = _version;
    Init();
  }

bool private ProductOrder_Active = true;

function Init() public {
    ProductOrder_Active = true;
}

bool private SupplierOrder_Active = false;

function SendProductOrder() public {
    if(ProductOrder_Active) {
        SupplierOrder_Active = true;
        ProductOrder_Active = false;
        emit next("","","ReceiveProductOrder");
    }
}

bool private Gateway_0dtfzfd_Active = false;

function SendSupplierOrder() public {
    if(SupplierOrder_Active) {
        Gateway_0dtfzfd_Active = true;
        Gateway_0dtfzfd();
        SupplierOrder_Active = false;
        emit next("","","ReceiveSupplierOrder");
    }
}

bool private TurnSupplierOrder_Active = false;

bool private TransportOrder_Active = false;

function Gateway_0dtfzfd() public {
    if (Gateway_0dtfzfd_Active) {
        TurnSupplierOrder_Active = true;
        TransportOrder_Active = true;
        Gateway_0dtfzfd_Active = false;
    }
}

bool private Gateway_1y210oa_from_TurnSupplierOrder_Active = false;

function SendTurnSupplierOrder() public {
    if(TurnSupplierOrder_Active) {
        Gateway_1y210oa_from_TurnSupplierOrder_Active = true;
        Gateway_1y210oa();
        TurnSupplierOrder_Active = false;
        emit next("","","ReceiveTurnSupplierOrder");
    }
}

bool private Gateway_1y210oa_from_TransportOrder_Active = false;

function SendTransportOrder() public {
    if(TransportOrder_Active) {
        Gateway_1y210oa_from_TransportOrder_Active = true;
        Gateway_1y210oa();
        TransportOrder_Active = false;
        emit next("","","ReceiveTransportOrder");
    }
}

bool private DeleveryRequest_Active = false;

function Gateway_1y210oa() public {
    if ( Gateway_1y210oa_from_TurnSupplierOrder_Active && Gateway_1y210oa_from_TransportOrder_Active) {
        DeleveryRequest_Active = true;
        Gateway_1y210oa_from_TurnSupplierOrder_Active = false;
        Gateway_1y210oa_from_TransportOrder_Active = false;
    }
}

bool private DeleveryInfo_Active = false;

function SendDeliveryRequest() public {
    if(DeleveryRequest_Active) {
        DeleveryInfo_Active = true;
        DeleveryRequest_Active = false;
        emit next("","","ReceiveDeliveryRequest");
    }
}

bool private Gateway_0g0hnby_Active = false;

function SendDeliveryInfo() public {
    if(DeleveryInfo_Active) {
        Gateway_0g0hnby_Active = true;
        DeleveryInfo_Active = false;
        Gateway_0g0hnby();
        emit next("","","ReceiveDeliveryInfo");
    }
}

bool private DeclarationRequest_Active = false;

bool private Confirmation_Active = false;

function Gateway_0g0hnby() public {
    if (Gateway_0g0hnby_Active) {
        DeclarationRequest_Active = true;
        Confirmation_Active = true;
        Gateway_0g0hnby_Active = false;
    }
}

bool private DeclarationForm_Active = false;

function SendDeclarationRequest() public {
    if(DeclarationRequest_Active) {
        DeclarationForm_Active = true;
        DeclarationRequest_Active = false;
        emit next("","","ReceiveDeclarationRequest");
    }
}

bool private Gateway_0p7qyz8_from_DeclarationForm_Active = false;

function SendDeclarationForm() public {
    if(DeclarationForm_Active) {
        Gateway_0p7qyz8_from_DeclarationForm_Active = true;
        Gateway_0p7qyz8();
        DeclarationForm_Active = false;
        emit next("","","ReceiveDeclarationForm");
    }
}

bool private Gateway_0p7qyz8_from_Confirmation_Active = false;

function SendConfirmation() public {
    if(Confirmation_Active) {
        Gateway_0p7qyz8_from_Confirmation_Active = true;
        Gateway_0p7qyz8();
        Confirmation_Active = false;
        emit next("","","ReceiveConfirmation");
    }
}

bool private Receipt_Active = false;

function Gateway_0p7qyz8() public {
    if ( Gateway_0p7qyz8_from_DeclarationForm_Active || Gateway_0p7qyz8_from_Confirmation_Active) {
        Receipt_Active = true;
        Gateway_0p7qyz8_from_DeclarationForm_Active = false;
        Gateway_0p7qyz8_from_Confirmation_Active = false;
    }
}

bool private ProductStatus_Active = false;

function SendReceipt() public {
    if(Receipt_Active) {
        ProductStatus_Active = true;
        Receipt_Active = false;
        emit next("","","ReceiveReceipt");
    }
}

bool private DeliveryOrder_Active = false;

function SendProductStatus() public {
    if(ProductStatus_Active) {
        DeliveryOrder_Active = true;
        ProductStatus_Active = false;
        emit next("","","ReceiveProductStatus");
    }
}

bool private Event_1ilon0o_Active = false;

function SendDeliveryOrder() public {
    if(DeliveryOrder_Active) {
        Event_1ilon0o_Active = true;
        DeliveryOrder_Active = false;
        emit next("","","ReceiveDeliveryOrder");
    }
}

function End() public {
    if(DeliveryOrder_Active) {
        Event_1ilon0o_Active = true;
    }
}

}
