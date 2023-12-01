---
comments: True
layout: post
toc: True
title: Logic Gates
description: Our Binary Project
type: hacks
courses: { "compsci": { "week": 2 } }
---

<head>
    <title>Logic Gate Calculator</title>
    <script>
        function calculateGate() {
            var input1 = document.getElementById('input1').value;
            var input2 = document.getElementById('input2').value;
            var gate = document.getElementById('gate').value;

            var result = document.getElementById('result');

            if (gate === 'and') {
                if (input1 === '1' && input2 === '1') {
                    result.innerHTML = "AND Gate Output: 1";
                } else {
                    result.innerHTML = "AND Gate Output: 0";
                }
            } else if (gate === 'or') {
                if (input1 === '1' || input2 === '1') {
                    result.innerHTML = "OR Gate Output: 1";
                } else {
                    result.innerHTML = "OR Gate Output: 0";
                }
            } else if (gate === 'xor') {
                if (input1 !== input2) {
                    result.innerHTML = "XOR Gate Output: 1";
                } else {
                    result.innerHTML = "XOR Gate Output: 0";
                }
            } else if (gate === 'nand') {
                if (!(input1 === '1' && input2 === '1')) {
                    result.innerHTML = "NAND Gate Output: 1";
                } else {
                    result.innerHTML = "NAND Gate Output: 0";
                }
            } else if (gate === 'nor') {
                if (!(input1 === '1' || input2 === '1')) {
                    result.innerHTML = "NOR Gate Output: 1";
                } else {
                    result.innerHTML = "NOR Gate Output: 0";
                }
            } else if (gate === 'xnor') {
                if (input1 === input2) {
                    result.innerHTML = "XNOR Gate Output: 1";
                } else {
                    result.innerHTML = "XNOR Gate Output: 0";
                }
            }
        }

        function setChoice(value, setId) {
            document.getElementById(setId).value = value;
        }

        function setGate(gateType) {
            document.getElementById('gate').value = gateType;
        }
    </script>

</head>
<body>
    <h1>Logic Gate Calculator</h1>
    <div>
        <h2>Set 1</h2>
        <button class="button" onclick="setChoice('1', 'input1')">1</button>
        <button class="button" onclick="setChoice('0', 'input1')">0</button>
        <input type="hidden" id="input1">
    </div>
    <div>
        <h2>Set 2</h2>
        <button class="button" onclick="setChoice('1', 'input2')">1</button>
        <button class="button" onclick="setChoice('0', 'input2')">0</button>
        <input type="hidden" id="input2">
    </div>
    <div>
        <h2>Select Gate</h2>
        <button class="button" onclick="setGate('and')">AND</button>
        <button class="button" onclick="setGate('or')">OR</button>
        <button class="button" onclick="setGate('xor')">XOR</button>
        <button class="button" onclick="setGate('nand')">NAND</button>
        <button class="button" onclick="setGate('nor')">NOR</button>
        <button class="button" onclick="setGate('xnor')">XNOR</button>
    </div>
    <br>
    <button class="button" onclick="calculateGate()">Calculate</button>
    <div id="result"></div>
    <input type="hidden" id="gate">
</body>
