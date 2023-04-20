// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveCommunicateExamSession = false;
  
  bool isActiveBookStudent = false;
  bool isEnabledBookStudent = false;
  
  bool isActiveChooseExam = false;
  bool isEnabledChooseExam = false;
  
  bool isActiveAdviseProfessor = false;
  
  bool isActiveBookExam = false;
  
  bool isActiveInitProfessor = false;
  bool isEnabledInitProfessor = false;
  
  bool isActiveReceiveEvaluation = false;
  bool isEnabledReceiveEvaluation = false;
  
  bool isActiveEvaluate = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveCommunicateExamSession = true;    //协作起点置为true
  }


  function CommunicateExamSession() external {
    if (isActiveCommunicateExamSession) {
          isEnabledChooseExam = true;
          ChooseExam();
    }
          isActiveBookStudent = true;
  }

  function BookStudent() public {
    if (isEnabledBookStudent) {
        emit next("", "", "BookStudent");
    }
          isActiveAdviseProfessor = true;
  }

  function ChooseExam() public {
    if (isEnabledChooseExam) {
        emit next("", "", "ChooseExam");
    }
          isActiveBookExam = true;
  }

  function AdviseProfessor() external {
    if (isActiveAdviseProfessor) {
          isEnabledInitProfessor = true;
          InitProfessor();
    }
  }

  function BookExam() external {
    if (isActiveBookExam) {
          isEnabledBookStudent = true;
          BookStudent();
    }
          isActiveReceiveEvaluation = true;
  }

  function InitProfessor() public {
    if (isEnabledInitProfessor) {
        emit next("", "", "InitProfessor");
    }
          isActiveEvaluate = true;
  }

  function ReceiveEvaluation() public {
    if (isEnabledReceiveEvaluation) {
        emit next("", "", "ReceiveEvaluation");
    }
  }

  function Evaluate() external {
    if (isActiveEvaluate) {
          isEnabledReceiveEvaluation = true;
          ReceiveEvaluation();
    }
  }

}
