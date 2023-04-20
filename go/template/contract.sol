// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {  
    version = _version;
    initSendProductOrder(false);  //  协作起点
  }


  bool isEnterproc_67 = false; //进入流程67
  bool isExitproc_67 = false;
  function initproc_67(bool fromSend) private {//初始化67，则初始化SendReceipt
      isEnterproc_67 = true;
      initSendReceipt(fromSend);
  }
  function endproc_67() private {
      isExitproc_67 = true;
      isExitproc_68 = true;
      endproc_68();
  }

  bool isEnterReceiveDeclarationRequest = false;
  bool isExitReceiveDeclarationRequest = false;
  bool isEnabledReceiveDeclarationRequest = false;
  function initReceiveDeclarationRequest(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveDeclarationRequest");
          isEnabledReceiveDeclarationRequest = true;
      } else {
          isEnterReceiveDeclarationRequest = true;
      }
  }
  function ReceiveDeclarationRequest() public {
    
    if (isEnabledReceiveDeclarationRequest) {
      endproc_78();
    }
  }

  bool isEnterproc_78 = false;
  bool isExitproc_78 = false;
  function initproc_78(bool fromSend) private {
      isEnterproc_78 = true;
      initReceiveDeclarationRequest(fromSend);
  }
  function endproc_78() private {
      isExitproc_78 = true;
      initproc_80(false);
  }

  bool isEnterproc_40 = false;
  bool isExitproc_40 = false;
  function initproc_40(bool fromSend) private {
      isEnterproc_40 = true;
  }
  function endproc_40() private {
      isExitproc_40 = true;
  }

  bool isEnterReceiveTransportOrder = false;
  bool isExitReceiveTransportOrder = false;
  bool isEnabledReceiveTransportOrder = false;
  function initReceiveTransportOrder(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveTransportOrder");
          isEnabledReceiveTransportOrder = true;
      } else {
          isEnterReceiveTransportOrder = true;
      }
  }
  function ReceiveTransportOrder() public {
    
    if (isEnabledReceiveTransportOrder) {
      endproc_42();
    }
  }

  bool isEnterproc_45 = false;
  bool isExitproc_45 = false;
  function initproc_45(bool fromSend) private {
      isEnterproc_45 = true;
      initSendDeliveryRequest(fromSend);
  }
  function endproc_45() private {
      isExitproc_45 = true;
      isExitproc_46 = true;
      endproc_46();
  }

  bool isEnterproc_49 = false;
  bool isExitproc_49 = false;
  function initproc_49(bool fromSend) private {
      isEnterproc_49 = true;
      initReceiveDeliveryInfo(fromSend);
  }
  function endproc_49() private {
      isExitproc_49 = true;
      isExitproc_50 = true;
      endproc_50();
  }

  bool isEnterSendTurnSupplierOrder = false;
  bool isExitSendTurnSupplierOrder = false;
  function initSendTurnSupplierOrder(bool fromSend) private {
      isEnterSendTurnSupplierOrder = true;
  }
  function SendTurnSupplierOrder() external {
    if (isEnterSendTurnSupplierOrder) {
      initReceiveTurnSupplierOrder(true);
      ReceiveTurnSupplierOrder();
      endproc_36();
    }
  }

  bool isEnterproc_46 = false;
  bool isExitproc_46 = false;
  function initproc_46(bool fromSend) private {
      isEnterproc_46 = true;
      initproc_42(fromSend);
  }
  function endproc_46() private {
      isExitproc_46 = true;
      initproc_49(false);
  }

  bool isEnterproc_75 = false;
  bool isExitproc_75 = false;
  function initproc_75(bool fromSend) private {
      isEnterproc_75 = true;
      initSendDeliveryInfo(fromSend);
  }
  function endproc_75() private {
      isExitproc_75 = true;
      isExitproc_76 = true;
      endproc_76();
  }

  bool isEnterproc_24 = false;
  bool isExitproc_24 = false;
  function initproc_24(bool fromSend) private {
      isEnterproc_24 = true;
      initproc_21(fromSend);
  }
  function endproc_24() private {
      isExitproc_24 = true;
      initproc_27(false);
  }

  bool isEnterproc_39 = false;
  bool isExitproc_39 = false;
  function initproc_39(bool fromSend) private {
      isEnterproc_39 = true;
      initproc_30(fromSend);
  }
  function endproc_39() private {
      isExitproc_39 = true;
  }

  bool isEnterproc_42 = false;
  bool isExitproc_42 = false;
  function initproc_42(bool fromSend) private {
      isEnterproc_42 = true;
      initReceiveTransportOrder(fromSend);
  }
  function endproc_42() private {
      isExitproc_42 = true;
      initproc_45(false);
  }

  bool isEnterproc_86 = false;
  bool isExitproc_86 = false;
  function initproc_86(bool fromSend) private {
      isEnterproc_86 = true;
      initproc_85(fromSend);
  }
  function endproc_86() private {
      isExitproc_86 = true;
      isExitproc_87 = true;
      endproc_87();
  }

  bool isEnterReceiveDeliveryOrder = false;
  bool isExitReceiveDeliveryOrder = false;
  bool isEnabledReceiveDeliveryOrder = false;
  function initReceiveDeliveryOrder(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveDeliveryOrder");
          isEnabledReceiveDeliveryOrder = true;
      } else {
          isEnterReceiveDeliveryOrder = true;
      }
  }
  function ReceiveDeliveryOrder() public {
    
    if (isEnabledReceiveDeliveryOrder) {
      endproc_10();
    }
  }

  bool isEnterproc_30 = false;
  bool isExitproc_30 = false;
  function initproc_30(bool fromSend) private {
      isEnterproc_30 = true;
      initReceiveSupplierOrder(fromSend);
  }
  function endproc_30() private {
      isExitproc_30 = true;
      initproc_38(false);
  }

  bool isEnterReceiveDeclarationForm = false;
  bool isExitReceiveDeclarationForm = false;
  bool isEnabledReceiveDeclarationForm = false;
  function initReceiveDeclarationForm(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveDeclarationForm");
          isEnabledReceiveDeclarationForm = true;
      } else {
          isEnterReceiveDeclarationForm = true;
      }
  }
  function ReceiveDeclarationForm() public {
    
    if (isEnabledReceiveDeclarationForm) {
      endproc_56();
    }
  }

  bool isEnterReceiveDeliveryRequest = false;
  bool isExitReceiveDeliveryRequest = false;
  bool isEnabledReceiveDeliveryRequest = false;
  function initReceiveDeliveryRequest(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveDeliveryRequest");
          isEnabledReceiveDeliveryRequest = true;
      } else {
          isEnterReceiveDeliveryRequest = true;
      }
  }
  function ReceiveDeliveryRequest() public {
    
    if (isEnabledReceiveDeliveryRequest) {
      endproc_72();
    }
  }

  bool isEnterSendDeliveryOrder = false;
  bool isExitSendDeliveryOrder = false;
  function initSendDeliveryOrder(bool fromSend) private {
      isEnterSendDeliveryOrder = true;
  }
  function SendDeliveryOrder() external {
    if (isEnterSendDeliveryOrder) {
      initReceiveDeliveryOrder(true);
      ReceiveDeliveryOrder();
      endproc_27();
    }
  }

  bool isEnterproc_33 = false;
  bool isExitproc_33 = false;
  function initproc_33(bool fromSend) private {
      isEnterproc_33 = true;
      initSendTransportOrder(fromSend);
  }
  function endproc_33() private {
      isExitproc_33 = true;
      isExitproc_37 = true;
      endproc_37();
  }

  bool isEnterSendDeliveryInfo = false;
  bool isExitSendDeliveryInfo = false;
  function initSendDeliveryInfo(bool fromSend) private {
      isEnterSendDeliveryInfo = true;
  }
  function SendDeliveryInfo() external {
    if (isEnterSendDeliveryInfo) {
      initReceiveDeliveryInfo(true);
      ReceiveDeliveryInfo();
      endproc_75();
    }
  }

  bool isEnterproc_76 = false;
  bool isExitproc_76 = false;
  function initproc_76(bool fromSend) private {
      isEnterproc_76 = true;
      initproc_73(fromSend);
  }
  function endproc_76() private {
      isExitproc_76 = true;
      initproc_86(false);
  }

  bool isEnterproc_80 = false;
  bool isExitproc_80 = false;
  function initproc_80(bool fromSend) private {
      isEnterproc_80 = true;
      initSendDeclarationForm(fromSend);
  }
  function endproc_80() private {
      isExitproc_80 = true;
      isExitproc_81 = true;
      endproc_81();
  }

  bool isEnterSendDeliveryRequest = false;
  bool isExitSendDeliveryRequest = false;
  function initSendDeliveryRequest(bool fromSend) private {
      isEnterSendDeliveryRequest = true;
  }
  function SendDeliveryRequest() external {
    if (isEnterSendDeliveryRequest) {
      initReceiveDeliveryRequest(true);
      ReceiveDeliveryRequest();
      endproc_45();
    }
  }

  bool isEnterproc_87 = false;
  bool isExitproc_87 = false;
  function initproc_87(bool fromSend) private {
      isEnterproc_87 = true;
      initproc_76(fromSend);
  }
  function endproc_87() private {
      isExitproc_87 = true;
  }

  bool isEnterproc_13 = false;
  bool isExitproc_13 = false;
  function initproc_13(bool fromSend) private {
      isEnterproc_13 = true;
      initReceiveProductOrder(fromSend);
  }
  function endproc_13() private {
      isExitproc_13 = true;
      initproc_16(false);
  }

  bool isEnterproc_16 = false;
  bool isExitproc_16 = false;
  function initproc_16(bool fromSend) private {
      isEnterproc_16 = true;
      initSendSupplierOrder(fromSend);
  }
  function endproc_16() private {
      isExitproc_16 = true;
      isExitproc_17 = true;
      endproc_17();
  }

  bool isEnterproc_23 = false;
  bool isExitproc_23 = false;
  function initproc_23(bool fromSend) private {
      isEnterproc_23 = true;
      initSendProductStatus(fromSend);
  }
  function endproc_23() private {
      isExitproc_23 = true;
      isExitproc_24 = true;
      endproc_24();
  }

  bool isEnterproc_37 = false;
  bool isExitproc_37 = false;
  function initproc_37(bool fromSend) private {
      isEnterproc_37 = true;
      initproc_33(fromSend);
      initproc_36(fromSend);
  }
  function endproc_37() private {
      isExitproc_37 = true;
      isExitproc_38 = true;
      endproc_38();
  }

  bool isEnterproc_27 = false;
  bool isExitproc_27 = false;
  function initproc_27(bool fromSend) private {
      isEnterproc_27 = true;
      initSendDeliveryOrder(fromSend);
  }
  function endproc_27() private {
      isExitproc_27 = true;
      isExitproc_28 = true;
      endproc_28();
  }

  bool isEnterproc_53 = false;
  bool isExitproc_53 = false;
  function initproc_53(bool fromSend) private {
      isEnterproc_53 = true;
      initSendDeclarationRequest(fromSend);
  }
  function endproc_53() private {
      isExitproc_53 = true;
      initproc_56(false);
  }

  bool isEnterproc_57 = false;
  bool isExitproc_57 = false;
  function initproc_57(bool fromSend) private {
      isEnterproc_57 = true;
      initproc_53(fromSend);
  }
  function endproc_57() private {
      isExitproc_57 = true;
      isExitproc_58 = true;
      endproc_58();
  }

  bool isEnterproc_61 = false;
  bool isExitproc_61 = false;
  function initproc_61(bool fromSend) private {
      isEnterproc_61 = true;
      initSendConfirmation(fromSend);
  }
  function endproc_61() private {
      isExitproc_61 = true;
      isExitproc_62 = true;
      endproc_62();
  }

  bool isEnterSendProductOrder = false;
  bool isExitSendProductOrder = false;
  function initSendProductOrder(bool fromSend) private {
      isEnterSendProductOrder = true;
  }
  function SendProductOrder() external {
    if (isEnterSendProductOrder) {
      initReceiveProductOrder(true); //enable receive product order事件
      ReceiveProductOrder();   //执行接收事件？？？？（因为数据是广播到所有人，所以默认被接收到？）
      endproc_2();
    }
  }

  bool isEnterproc_10 = false;
  bool isExitproc_10 = false;
  function initproc_10(bool fromSend) private {
      isEnterproc_10 = true;
      initReceiveDeliveryOrder(fromSend);// 8
  }
  function endproc_10() private {
      isExitproc_10 = true;
      isExitproc_11 = true;
      endproc_11();
  }

  bool isEnterproc_17 = false;
  bool isExitproc_17 = false;
  function initproc_17(bool fromSend) private {
      isEnterproc_17 = true;
      initproc_13(fromSend);
  }
  function endproc_17() private {
      isExitproc_17 = true;
      initproc_20(false);
  }

  bool isEnterSendProductStatus = false;
  bool isExitSendProductStatus = false;
  function initSendProductStatus(bool fromSend) private {
      isEnterSendProductStatus = true;
  }
  function SendProductStatus() external {
    if (isEnterSendProductStatus) {
      initReceiveProductStatus(true);
      ReceiveProductStatus();
      endproc_23();
    }
  }

  bool isEnterSendReceipt = false;
  bool isExitSendReceipt = false;
  function initSendReceipt(bool fromSend) private {
      isEnterSendReceipt = true;
  }
  function SendReceipt() external {
    if (isEnterSendReceipt) {
      initReceiveReceipt(true);
      ReceiveReceipt();
      endproc_67();
    }
  }

  bool isEnterSendDeclarationForm = false;
  bool isExitSendDeclarationForm = false;
  function initSendDeclarationForm(bool fromSend) private {
      isEnterSendDeclarationForm = true;
  }
  function SendDeclarationForm() external {
    if (isEnterSendDeclarationForm) {
      initReceiveDeclarationForm(true);
      ReceiveDeclarationForm();
      endproc_80();
    }
  }

  bool isEnterproc_82 = false;
  bool isExitproc_82 = false;
  function initproc_82(bool fromSend) private {
      isEnterproc_82 = true;
      initproc_81(fromSend);
  }
  function endproc_82() private {
      isExitproc_82 = true;
      isExitproc_85 = true;
      endproc_85();
  }

  bool isEnterproc_85 = false;
  bool isExitproc_85 = false;
  function initproc_85(bool fromSend) private {
      isEnterproc_85 = true;
      initproc_84(fromSend);
      initproc_82(fromSend);
  }
  function endproc_85() private {
      isExitproc_85 = true;
      isExitproc_86 = true;
      endproc_86();
  }

  bool isEnterproc_20 = false;
  bool isExitproc_20 = false;
  function initproc_20(bool fromSend) private {
      isEnterproc_20 = true;
      initReceiveReceipt(fromSend);
  }
  function endproc_20() private {
      isExitproc_20 = true;
      isExitproc_21 = true;
      endproc_21();
  }

  bool isEnterproc_38 = false;
  bool isExitproc_38 = false;
  function initproc_38(bool fromSend) private {
      isEnterproc_38 = true;
      initproc_37(fromSend);
  }
  function endproc_38() private {
      isExitproc_38 = true;
      isExitproc_39 = true;
      endproc_39();
  }

  bool isEnterSendDeclarationRequest = false;
  bool isExitSendDeclarationRequest = false;
  function initSendDeclarationRequest(bool fromSend) private {
      isEnterSendDeclarationRequest = true;
  }
  function SendDeclarationRequest() external {
    if (isEnterSendDeclarationRequest) {
      initReceiveDeclarationRequest(true);
      ReceiveDeclarationRequest();
      endproc_53();
    }
  }

  bool isEnterReceiveTurnSupplierOrder = false;
  bool isExitReceiveTurnSupplierOrder = false;
  bool isEnabledReceiveTurnSupplierOrder = false;
  function initReceiveTurnSupplierOrder(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveTurnSupplierOrder");
          isEnabledReceiveTurnSupplierOrder = true;
      } else {
          isEnterReceiveTurnSupplierOrder = true;
      }
  }
  function ReceiveTurnSupplierOrder() public {
    
    if (isEnabledReceiveTurnSupplierOrder) {
      endproc_70();
    }
  }

  bool isEnterproc_70 = false;
  bool isExitproc_70 = false;
  function initproc_70(bool fromSend) private {
      isEnterproc_70 = true;
      initReceiveTurnSupplierOrder(fromSend);
  }
  function endproc_70() private {
      isExitproc_70 = true;
      initproc_72(false);
  }

  bool isEnterSendConfirmation = false;
  bool isExitSendConfirmation = false;
  function initSendConfirmation(bool fromSend) private {
      isEnterSendConfirmation = true;
  }
  function SendConfirmation() external {
    if (isEnterSendConfirmation) {
      initReceiveConfirmation(true);
      ReceiveConfirmation();
      endproc_61();
    }
  }

  bool isEnterproc_66 = false;
  bool isExitproc_66 = false;
  function initproc_66(bool fromSend) private {
      isEnterproc_66 = true;
      initSendReceipt(fromSend);
  }
  function endproc_66() private {
      isExitproc_66 = true;
  }

  bool isEnterproc_88 = false;
  bool isExitproc_88 = false;
  function initproc_88(bool fromSend) private {
      isEnterproc_88 = true;
  }
  function endproc_88() private {
      isExitproc_88 = true;
  }

  bool isEnterReceiveProductStatus = false;
  bool isExitReceiveProductStatus = false;
  bool isEnabledReceiveProductStatus = false;
  function initReceiveProductStatus(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveProductStatus");
          isEnabledReceiveProductStatus = true;
      } else {
          isEnterReceiveProductStatus = true;
      }
  }
  function ReceiveProductStatus() public {
    
    if (isEnabledReceiveProductStatus) {
      endproc_5();
    }
  }

  bool isEnterReceiveProductOrder = false;
  bool isExitReceiveProductOrder = false;
  bool isEnabledReceiveProductOrder = false;
  function initReceiveProductOrder(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveProductOrder");
          isEnabledReceiveProductOrder = true;
      } else {
          isEnterReceiveProductOrder = true;
      }
  }
  function ReceiveProductOrder() public {
    
    if (isEnabledReceiveProductOrder) {
      endproc_13();
    }
  }

  bool isEnterproc_28 = false;
  bool isExitproc_28 = false;
  function initproc_28(bool fromSend) private {
      isEnterproc_28 = true;
      initproc_24(fromSend);
  }
  function endproc_28() private {
      isExitproc_28 = true;
  }

  bool isEnterproc_56 = false;
  bool isExitproc_56 = false;
  function initproc_56(bool fromSend) private {
      isEnterproc_56 = true;
      initReceiveDeclarationForm(fromSend);
  }
  function endproc_56() private {
      isExitproc_56 = true;
      isExitproc_57 = true;
      endproc_57();
  }

  bool isEnterproc_62 = false;
  bool isExitproc_62 = false;
  function initproc_62(bool fromSend) private {
      isEnterproc_62 = true;
      initproc_58(fromSend);
      initproc_61(fromSend);
  }
  function endproc_62() private {
      isExitproc_62 = true;
      isExitproc_63 = true;
      endproc_63();
  }

  bool isEnterproc_81 = false;
  bool isExitproc_81 = false;
  function initproc_81(bool fromSend) private {
      isEnterproc_81 = true;
      initproc_78(fromSend);
  }
  function endproc_81() private {
      isExitproc_81 = true;
      isExitproc_82 = true;
      endproc_82();
  }

  bool isEnterproc_68 = false;
  bool isExitproc_68 = false;
  function initproc_68(bool fromSend) private {
      isEnterproc_68 = true;
      initproc_64(fromSend);
  }
  function endproc_68() private {
      isExitproc_68 = true;
  }

  bool isEnterproc_73 = false;
  bool isExitproc_73 = false;
  function initproc_73(bool fromSend) private {
      isEnterproc_73 = true;
      initproc_70(fromSend);
  }
  function endproc_73() private {
      isExitproc_73 = true;
      initproc_75(false);
  }

  bool isEnterproc_36 = false;
  bool isExitproc_36 = false;
  function initproc_36(bool fromSend) private {
      isEnterproc_36 = true;
      initSendTurnSupplierOrder(fromSend);
  }
  function endproc_36() private {
      isExitproc_36 = true;
      isExitproc_37 = true;
      endproc_37();
  }

  bool isEnterproc_50 = false;
  bool isExitproc_50 = false;
  function initproc_50(bool fromSend) private {
      isEnterproc_50 = true;
      initproc_46(fromSend);
  }
  function endproc_50() private {
      isExitproc_50 = true;
      initproc_63(false);
  }

  bool isEnterSendSupplierOrder = false;
  bool isExitSendSupplierOrder = false;
  function initSendSupplierOrder(bool fromSend) private {
      isEnterSendSupplierOrder = true;
  }
  function SendSupplierOrder() external {   //Manufacturer的发送事件
    if (isEnterSendSupplierOrder) { //判断是否处于执行状态，是则调用next进程的init方法，以及end进程的end方法
      initReceiveSupplierOrder(true);  //怎么会init
      ReceiveSupplierOrder();
      endproc_16();
    }
  }

  bool isEnterReceiveReceipt = false;
  bool isExitReceiveReceipt = false;
  bool isEnabledReceiveReceipt = false;
  function initReceiveReceipt(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveReceipt");
          isEnabledReceiveReceipt = true;
      } else {
          isEnterReceiveReceipt = true;
      }
  }
  function ReceiveReceipt() public {
    
    if (isEnabledReceiveReceipt) {
      endproc_20();
    }
  }

  bool isEnterproc_26 = false;
  bool isExitproc_26 = false;
  function initproc_26(bool fromSend) private {
      isEnterproc_26 = true;
      initSendDeliveryOrder(fromSend);
  }
  function endproc_26() private {
      isExitproc_26 = true;
  }

  bool isEnterReceiveSupplierOrder = false;
  bool isExitReceiveSupplierOrder = false;
  bool isEnabledReceiveSupplierOrder = false;
  function initReceiveSupplierOrder(bool fromSend) private { 
      if (fromSend) {                     //fromSend为true（来自发送方的调用），则enable 接收事件
          emit next("", "", "ReceiveSupplierOrder");
          isEnabledReceiveSupplierOrder = true;
      } else {                            //否则（来自内部的调用），进入接收状态              
          isEnterReceiveSupplierOrder = true;
      }
  }
  function ReceiveSupplierOrder() public {
    
    if (isEnabledReceiveSupplierOrder) {
      endproc_30();
    }
  }

  bool isEnterproc_58 = false;
  bool isExitproc_58 = false;
  function initproc_58(bool fromSend) private {
      isEnterproc_58 = true;
      initproc_57(fromSend);
  }
  function endproc_58() private {
      isExitproc_58 = true;
      isExitproc_62 = true;
      endproc_62();
  }

  bool isEnterproc_64 = false;
  bool isExitproc_64 = false;
  function initproc_64(bool fromSend) private {
      isEnterproc_64 = true;
      initproc_50(fromSend);
  }
  function endproc_64() private {
      isExitproc_64 = true;
      initproc_67(false);
  }

  bool isEnterproc_5 = false;
  bool isExitproc_5 = false;
  function initproc_5(bool fromSend) private {
      isEnterproc_5 = true;
      initReceiveProductStatus(fromSend);
  }
  function endproc_5() private {
      isExitproc_5 = true;
      isExitproc_6 = true;
      endproc_6();
  }

  bool isEnterproc_6 = false;
  bool isExitproc_6 = false;
  function initproc_6(bool fromSend) private {
      isEnterproc_6 = true;
      initproc_2(fromSend);
  }
  function endproc_6() private {
      isExitproc_6 = true;
      initproc_10(false);
  }

  bool isEnterproc_9 = false;
  bool isExitproc_9 = false;
  function initproc_9(bool fromSend) private {
      isEnterproc_9 = true;
      initReceiveDeliveryOrder(fromSend);
  }
  function endproc_9() private {
      isExitproc_9 = true;
  }

  bool isEnterReceiveDeliveryInfo = false;
  bool isExitReceiveDeliveryInfo = false;
  bool isEnabledReceiveDeliveryInfo = false;
  function initReceiveDeliveryInfo(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveDeliveryInfo");
          isEnabledReceiveDeliveryInfo = true;
      } else {
          isEnterReceiveDeliveryInfo = true;
      }
  }
  function ReceiveDeliveryInfo() public {
    
    if (isEnabledReceiveDeliveryInfo) {
      endproc_49();
    }
  }

  bool isEnterproc_63 = false;
  bool isExitproc_63 = false;
  function initproc_63(bool fromSend) private {
      isEnterproc_63 = true;
      initproc_62(fromSend);
  }
  function endproc_63() private {
      isExitproc_63 = true;
      isExitproc_64 = true;
      endproc_64();
  }

  bool isEnterproc_72 = false;
  bool isExitproc_72 = false;
  function initproc_72(bool fromSend) private {
      isEnterproc_72 = true;
      initReceiveDeliveryRequest(fromSend);
  }
  function endproc_72() private {
      isExitproc_72 = true;
      isExitproc_73 = true;
      endproc_73();
  }

  bool isEnterReceiveConfirmation = false;
  bool isExitReceiveConfirmation = false;
  bool isEnabledReceiveConfirmation = false;
  function initReceiveConfirmation(bool fromSend) private {
      if (fromSend) {
          emit next("", "", "ReceiveConfirmation");
          isEnabledReceiveConfirmation = true;
      } else {
          isEnterReceiveConfirmation = true;
      }
  }
  function ReceiveConfirmation() public {
    
    if (isEnabledReceiveConfirmation) {
      endproc_84();
    }
  }

  bool isEnterproc_84 = false;
  bool isExitproc_84 = false;
  function initproc_84(bool fromSend) private {
      isEnterproc_84 = true;
      initReceiveConfirmation(fromSend);
  }
  function endproc_84() private {
      isExitproc_84 = true;
      isExitproc_85 = true;
      endproc_85();
  }

  bool isEnterproc_2 = false;
  bool isExitproc_2 = false;
  function initproc_2(bool fromSend) private {
      isEnterproc_2 = true;
      initSendProductOrder(fromSend);
  }
  function endproc_2() private {
      isExitproc_2 = true;
      initproc_5(false);
  }

  bool isEnterproc_11 = false;
  bool isExitproc_11 = false;
  function initproc_11(bool fromSend) private {
      isEnterproc_11 = true;
      initproc_6(fromSend);
  }
  function endproc_11() private {
      isExitproc_11 = true;
  }

  bool isEnterproc_21 = false;
  bool isExitproc_21 = false;
  function initproc_21(bool fromSend) private {
      isEnterproc_21 = true;
      initproc_17(fromSend);
  }
  function endproc_21() private {
      isExitproc_21 = true;
      initproc_23(false);
  }

  bool isEnterSendTransportOrder = false;
  bool isExitSendTransportOrder = false;
  function initSendTransportOrder(bool fromSend) private {
      isEnterSendTransportOrder = true;
  }
  function SendTransportOrder() external {
    if (isEnterSendTransportOrder) {
      initReceiveTransportOrder(true);
      ReceiveTransportOrder();
      endproc_33();
    }
  }
}
