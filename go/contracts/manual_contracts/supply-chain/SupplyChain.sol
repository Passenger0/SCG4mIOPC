//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.24;

contract SupplyChain {
    bool private activeSupplierOrder = false; //发送与接收事件的状态
    bool private activeProduceStatus = false;
    bool private activeDeliveryOrder = false;
    bool private activeTransportOrder = false;
    bool private activeTurnSupplierOrder = false;
    bool private activeDeliveryRequest = false;
    bool private activeDeliveryInfo1 = false;
    bool private activeDeliveryInfo2 = false;
    bool private activeDeclarationRequest = false;
    bool private activeConfirmation = false;
    bool private activeDeclarationForm = false;
    bool private activeReceipt = false;
    
    string public version;
    constructor(string memory _version) public {  
        version = _version;
    }

    event next(bytes from, bytes to, bytes activity);//消息广播
    //都是外部调用过的函数，12个
    function SendProductOrder() public {
        //接收到ProductOrder,enable SupplierOrder的发送事件
        activeSupplierOrder = true;  
        emit next("", "", "ReceiveProductOrder");

        //调用函数则表示发送事件完成，忽略了接收事件
        //在以上基础上，考虑两个先后发生的发送事件的顺序
        //但是暂时没有考虑xor网关的功能，少了一定的约束

    }

    function SendTransportOrder() public {
        if (activeTransportOrder) {
            activeDeliveryRequest = true;
            emit next("", "", "ReceiveTransportOrder");
        }
    }

    function SendTurnSupplierOrder() public {
        if (activeTurnSupplierOrder) {
            activeDeliveryInfo1 = true;
            emit next("", "", "ReceiveTurnSupplierOrder");
        }
    }

    function SendSupplierOrder() public {
        if (activeSupplierOrder) {
            activeTurnSupplierOrder = true;
            activeTransportOrder = true;
            emit next("", "", "ReceiveSupplierOrder");
        }
    }

    function SendProductStatus() public {
        if (activeProduceStatus) {
            emit next("", "", "ReceiveProductStatus");
        }
    }

    function SendDeliveryOrder() public {
        if (activeDeliveryOrder) {
            emit next("", "", "ReceiveDeliverOrder");
        }
    }

    function SendDeliveryRequest() public {
        if (activeDeliveryRequest) {
            activeDeliveryInfo2 = true;
            emit next("", "", "ReceiveDeliveryRequest");
        }
    }

    function SendDeclarationRequest() public {
        if (activeDeclarationRequest) {
            activeReceipt = true;
            emit next("", "", "ReceiveDecalrationRequest");
        }
    }

    function SendDeliveryInfo() public {
        if (activeDeliveryInfo1 && activeDeliveryInfo2) {
            activeDeclarationRequest = true;
            activeConfirmation = true;
            emit next("", "", "ReceiveDeliveryInfo");
        }
    }

    function SendDeclarationForm() public {
        if (activeDeclarationForm) {
            activeReceipt = true;
            emit next("", "", "ReceiveDeclarationForm");
        }
    }

    function SendConfirmation() public {
        if (activeConfirmation) {
            activeDeclarationForm = true;
            activeReceipt = true;
            emit next("", "", "ReceiveConfirmation");
        }
    }

    function SendReceipt() public {
        if (activeReceipt) {
            activeProduceStatus = true;
            activeDeliveryOrder = true;
            emit next("", "", "ReceiveReceipt");
        }
    }

}