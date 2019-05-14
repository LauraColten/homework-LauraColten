..  include::  ./images/Fetch.jpg
..  include::  ./images/Decode.jpg
..  include::  ./images/Execute.jpg
..  include::  ./images/Store.jpg

Exam2: Major Tom's Counting Maching
##################
:Author: Laura Colten
:Course: COSC2325-004
:Instructor: Roie R. Black
:Started on: April 22, 2019
:Submitted on: May 12, 2019

Problem Statement
#################

Based on the limited number of parts found on his ship, Major Tom needs to contruct a VERY simple machine that can produce the answers to simple math
problems.
Requirements:

- IN and OUT registers have simple connections to the keyboard and display.
- IN register is not driven by a clock.
- The machine triggers into action when the user presses a key.
- The machine can only handle one-digit inputs.
- The machine will toggle from ADD to SUB.

Code
####

ALU.cpp

.. code-block:: cpp

  #include <iostream>
  #include <array>
  #include "Process.cpp"

  //Machine Control Logic
  int main() {


      int numArray[4];
      char opArray[4];
      int counter = 0;

      // Fetch Unit
      for (int i = 0; i < 4; i++) {
          std::cout << "Please enter the operation (+ or -): " << std::endl;
          std::cin >> opArray[i];//r3 (+ or -)
          std::cout << "Please enter a number: "<< std::endl;
          std::cin >> numArray[i];//r1, KEY digit
      }

      for (int i = 0; i < 4; i++) {
          std::cout << opArray[i] << numArray[i];
      }
      std::cout << std::endl;
      process(opArray, numArray);
  }


Process.cpp

.. code-block:: cpp

  #include <iostream>

  void process(char opArray[4], int numArray[4]) {
      int display = 0;
      for (int i = 0; i < 4; i++) {
          // Decode Unit
          if (opArray[i] == '+') { //r3, 0
              std::cout << "processing: " << opArray[i];
              std::cout << std::endl;
              std::cout << "displaying: " << display << std::endl;
              // Execute Unit
              display += numArray[i];
              std::cout << "processing: " << numArray[i];
          }else if (opArray[i] == '-'){
              std::cout << "processing: " << opArray[i];
              std::cout << std::endl;
              std::cout << "displaying: " << display << std::endl;
              // Execute Unit
              display -= numArray[i];
              std::cout << "processing: " << numArray[i];
          }else {
              break;
          }

          std::cout << std::endl;
          // Store Unit
          std::cout << "displaying: " << display; //r2 OUT
          std::cout << std::endl;
          std::cout << std::endl;
      }
  }



Test.cpp

.. code-block:: cpp

  void test() {
    char opArray[] = { '+', '-', '+', '-' };
    int numArray[] = {1, 2, 3, 4};
    process(opArray, numArray);
  }


AVR - RTL code

.. code-block:: cpp

            LDI   r2, 0   ;reset the count
            LDI   r3, 0   ;1 means sub, 0 means ADD
            ;
    start:  OUT   LCD, r2 ;display current count
            ;get operation key from user
            IN    r1, KEY ;get user key
            CPI   r1, '+' ;plus?
            BRNE  chksub  ;branch if not equal
            LDI   r3, 0   ;set op to ADD
            JMP   digit   ;get the digit to ADD
    chksub: CPI   r1, '-' ;minus?
            BRNE  start   ;illegal op to sub
            LDI   r3, 1   ;set op to sub
            : get the digit to process
            IN    rl, KEY ;test digit to char
    digit:  CPI   r1, 0   ;test for zero
            BREQ  start   ;branch if zero
            CPI   r2, 0   ;do we add?
            BREQ  dosub   ;jump if not
    doadd:  INC   r2      ;count up
            DEC   r1      ;count key down
            JMP   digit   ;keep going
    dosub:  DEC   r2      ;count down
            DEC   r1      ;count key down
            JMP   digit   ;keep going


    r1 <- KEY
    r3 <- 0
    r1, r3 <- KEY
    r1 <- KEY
    r3 <- 0
    r1, r3 <- KEY
    r1 <- KEY
    r3 <- 0
    r1, r3 <- KEY
    r1 <- KEY
    r3 <- 1
    KEY < r1, r3
    r2 <- KEY




Unit Diagrams
#############

Fetch Unit
==========
.. image:: ./images/Fetch.jpg
   :align: center
   :width: 500

Decode Unit
===========
.. image:: ./images/Decode.jpg
   :align: center
   :width: 500

Execute Unit
============
.. image:: ./images/Execute.jpg
   :align: center
   :width: 500

Store Unit
==========
.. image:: ./images/Store.jpg
   :align: center
   :width: 500

Design Review
#############

Machine Improvements:

- The machine could be improved by changing the code to accept multi-digit inputs.
- It could be improved with a dynamically increasing/decreasing number of inputs.
