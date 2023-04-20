//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.9.0;

contract OnlineEducation {
    address TravelAgency;
    address Customer;

    bool private activeAdviseProfessor = false;
    bool private activeBookExam = false;
    bool private activeEvaluate = false;

    string public version;
    constructor(string memory _version) public {  
        version = _version;
    }

    event next(bytes from, bytes to, bytes activity);//消息广播

    function CommunicateExamSession() public {
        activeBookExam = true;
        emit next("", "", "ChooseExam");
    }

    function BookExam() public {
        if (activeBookExam) {
            activeAdviseProfessor = true;
            emit next("", "", "BookStudent");
        }
    }

    function AdviseProfessor() public {
        if(activeAdviseProfessor) {
            activeEvaluate = true;
            emit next("", "", "InitProfessor");
        }
    }

    function Evaluate() public {
        if (activeEvaluate) {
            emit next("", "", "ReceiveEvaluation");
        }
    }
}