pragma solidity >=0.4.24;
contract Registry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {
    version = _version;
    Init();
  }

bool private CakeRequest_Active = false;

function Init() public {
    CakeRequest_Active = true;
}

bool private LayerRequest_Active = false;
bool private DeRequest_Active = false;
bool private Decoration_Active = false;

function SendCakeRequest() public {
    if(CakeRequest_Active) {
        DeRequest_Active = true;
        LayerRequest_Active = true;
        CakeRequest_Active = false;
        emit next("","","CakePreparation");
    }
}


function AssignLayers() public {
    if(LayerRequest_Active) {
        LayerRequest_Active = false;
        emit next("","","LayerPreparation");
    }
}


function SendDecorationsRequest() public {
    if(DeRequest_Active) {
        Decoration_Active = true;
        DeRequest_Active = false;
        emit next("","","ReceiveDecorations");
    }
}

bool private Layer_Active = false;

function AssignDecoration() public {
    if(Decoration_Active) {
        Layer_Active = true;
        Decoration_Active = false;
        emit next("","","ReceiveDecoration");
    }
}

bool private Cake_Active = false;

function SendDecoratedLayer() public {
    if(Layer_Active) {
        Cake_Active = true;
        Layer_Active = false;
        emit next("","","ReceiveAndCombineLayer");
    }
}

bool private Event_1ilon0o_Active = false;

function SendCake() public {
    if(Cake_Active) {
        Event_1ilon0o_Active = true;
        Cake_Active = false;
        emit next("","","ReceiveCake");
    }
}

function End() public {
    if(Cake_Active) {
        Event_1ilon0o_Active = true;
    }
}

}
