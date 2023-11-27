---
comments: True
layout: post
toc: True
title: Binary Project
description: Our Binary Project
type: hacks
courses: { "compsci": { "week": 2 } }
---
# BINARY LIGHTUP THING
<style>
    td {
        text-align: center;
        vertical-align: middle;
    }
</style>

<table>
    <thead>
        <tr class="header" id="table">
            <th>Plus</th>
            <th>Binary</th>
            <th>Octal</th>
            <th>Hexadecimal</th>
            <th>Decimal</th>
            <th>Minus</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><div class="button" id="add1" onclick="add(1)">+1</div></td>
            <td id="binary">00000000</td>
            <td id="octal">0</td>
            <td id="hexadecimal">0</td>
            <td id="decimal">0</td>
            <td><div class="button" id="sub1" onclick="add(-1)">-1</div></td>
        </tr>
    </tbody>
</table>

{% comment %}
Liquid for loop includes last number, thus the Minus
{% endcomment %}
{% assign bits = BITS | minus: 1 %} 

<table>
    <thead>
        <tr>
            {% comment %}
            Build many bits
            {% endcomment %}
            {% for i in (0..bits) %}
            <th><img src="https://iili.io/JxdDzUG.png" alt="JxdDzUG.png">
                <div class="button" id="butt{{ i }}" onclick="javascript:toggleBit({{ i }})">Turn on</div>
            </th>
            {% endfor %}
        </tr>
    </thead>
    <tbody>
        <tr>
            {% comment %}
            Value of bit
            {% endcomment %}
            {% for i in (0..bits) %}
            <td><input type='text' id="digit{{ i }}" Value="0" size="1" readonly></td>
            {% endfor %}
        </tr>
    </tbody>
</table>

<script>
    const BITS = {{ BITS }};
    const MAX = 2 ** BITS - 1;
    const MSG_ON = "Turn on";
    const IMAGE_ON = "{{site.baseurl}}/images/bulb_on.png";
    const MSG_OFF = "Turn off";
    const IMAGE_OFF = "{{site.baseurl}}/images/bulb_off.png"

    // return string with current value of each bit
    function getBits() {
        let bits = "";
        for(let i = 0; i < BITS; i++) {
            bits = bits + document.getElementById('digit' + i).value;
        }
        return bits;
    }
    // setter for Document Object Model (DOM) values
    function setConversions(binary) {
        document.getElementById('binary').innerHTML = binary;
        // Octal conversion
        document.getElementById('octal').innerHTML = parseInt(binary, 2).toString(8);
        // Hexadecimal conversion
        document.getElementById('hexadecimal').innerHTML = parseInt(binary, 2).toString(16);
        // Decimal conversion
        document.getElementById('decimal').innerHTML = parseInt(binary, 2).toString();
    }
    // convert decimal to base 2 using modulo with divide method
    function decimal_2_base(decimal, base) {
        let conversion = "";
        // loop to convert to base
        do {
            let digit = decimal % base;           // obtain right most digit
            conversion = "" + digit + conversion; // what does this do? inserts digit to front of string
            decimal = ~~(decimal / base);         // what does this do? divides by base what is ~~? force whole number
        } while (decimal > 0);                    // why while at the end? 0 pads front of binary number
            // loop to pad with zeros
            if (base === 2) {                     // only pad for binary conversions
                for (let i = 0; conversion.length < BITS; i++) {
                    conversion = "0" + conversion;
            }
        }
        return conversion;
    }
    // toggle selected bit and recalculate
    function toggleBit(i) {
        //alert("Digit action: " + i );
        const dig = document.getElementById('digit' + i);
        const image = document.getElementById('bulb' + i);
        const butt = document.getElementById('butt' + i);
        // Change digit and visual
        if (image.src.match(IMAGE_ON)) {
            dig.value = 0;
            image.src = IMAGE_OFF;
            butt.innerHTML = MSG_ON;
        } else {
            dig.value = 1;
            image.src = IMAGE_ON;
            butt.innerHTML = MSG_OFF;
        }
        // Binary numbers
        const binary = getBits();
        setConversions(binary);
    }
    // add is positive integer, subtract is negative integer
    function add(n) {
        let binary = getBits();
        // convert to decimal and do math
        let decimal = parseInt(binary, 2);
        if (n > 0) {  // PLUS
            decimal = MAX === decimal ? 0 : decimal += n; // OVERFLOW or PLUS
        } else  {     // MINUS
            decimal = 0 === decimal ? MAX : decimal += n; // OVERFLOW or MINUS
        }
        // convert the result back to binary
        binary = decimal_2_base(decimal, 2);
        // update conversions
        setConversions(binary);
        // update bits
        for (let i = 0; i < binary.length; i++) {
            let digit = binary.substr(i, 1);
            document.getElementById('digit' + i).value = digit;
            if (digit === "1") {
                document.getElementById('bulb' + i).src = IMAGE_ON;
                document.getElementById('butt' + i).innerHTML = MSG_OFF;
            } else {
                document.getElementById('bulb' + i).src = IMAGE_OFF;
                document.getElementById('butt' + i).innerHTML = MSG_ON;
            }
        }
    }
</script>

# Quiz

<button class="button" type="button">Click Me!</button>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .container {
        background: linear-gradient(to bottom, #C0C0C0, #fff);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input {
            width: 80%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .button-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .button {
            padding: 8px;
        }

        #encryptedPassword {
            margin-top: 20px;
        }
    </style>

</head>
<body>

<div class="container">
    <h2>Password Encrypter</h2>
    <label for="password">Enter Password:</label>
    <input type="password" id="password" placeholder="Enter your password">
    <div class="button-container">
        <button class="button" onclick="encryptPassword()">Encrypt</button>
        <button class="button" onclick="togglePassword()">View/Hide Password</button>
    </div>
    <p id="encryptedPassword">Encrypted Password: </p>

    <script>
        function togglePassword() {
            var passwordInput = document.getElementById("password");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }

        function encryptPassword() {
            var passwordInput = document.getElementById("password");
            var encryptedPassword = document.getElementById("encryptedPassword");

            if (passwordInput.value === "") {
                alert("Please enter a password.");
                return;
            }

            // conveert da password to binary
            var binaryPassword = passwordInput.value.split('').map(function (char) {
                return char.charCodeAt(0).toString(2).padStart(8, '0');
            }).join(' ');

            encryptedPassword.textContent = "Encrypted Password: " + binaryPassword;
        }
    </script>

</div>

</body>

<style>
        .container {
        background: linear-gradient(to bottom, #C0C0C0, #fff);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 40px;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input {
            width: 80%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .button-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .button {
            padding: 8px;
        }

        #decryptedPassword {
            margin-top: 20px;
        }
    </style>

<body>

<div class="container">
    <h2>Password Decrypter</h2>
    <label for="binaryPassword">Enter Binary Password:</label>
    <input type="password" id="binaryPassword" placeholder="Enter binary-encoded password">
    <div class="button-container">
        <button class="button" onclick="decryptPassword()">Decrypt</button>
        <button class="button" onclick="toggleBinaryPassword()">View/Hide Binary Password</button>
    </div>
    <p id="decryptedPassword">Decrypted Password: </p>

    <script>
        function toggleBinaryPassword() {
            var binaryPasswordInput = document.getElementById("binaryPassword");

            if (binaryPasswordInput.type === "text") {
                binaryPasswordInput.type = "password";
            } else {
                binaryPasswordInput.type = "text";
            }
        }

        function decryptPassword() {
            var binaryPasswordInput = document.getElementById("binaryPassword");
            var decryptedPassword = document.getElementById("decryptedPassword");

            if (binaryPasswordInput.value === "") {
                alert("Please enter a binary-encoded password.");
                return;
            }

            // convert binary to characters
            var decodedPassword = binaryPasswordInput.value.split(' ').map(function (binary) {
                return String.fromCharCode(parseInt(binary, 2));
            }).join('');

            decryptedPassword.textContent = "Decrypted Password: " + decodedPassword;
        }
    </script>

</div>

</body>



<html>
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
        <button onclick="setChoice('1', 'input1')">1</button>
        <button onclick="setChoice('0', 'input1')">0</button>
        <input type="hidden" id="input1">
    </div>
    <div>
        <h2>Set 2</h2>
        <button onclick="setChoice('1', 'input2')">1</button>
        <button onclick="setChoice('0', 'input2')">0</button>
        <input type="hidden" id="input2">
    </div>
    <div>
        <h2>Select Gate</h2>
        <button onclick="setGate('and')">AND</button>
        <button onclick="setGate('or')">OR</button>
        <button onclick="setGate('xor')">XOR</button>
        <button onclick="setGate('nand')">NAND</button>
        <button onclick="setGate('nor')">NOR</button>
        <button onclick="setGate('xnor')">XNOR</button>
    </div>
    <br>
    <button onclick="calculateGate()">Calculate</button>
    <div id="result"></div>
    <input type="hidden" id="gate">
</body>
</html>



# LIGHTBULBS
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Light Bulb Simulator</title>
    <style>
        #lightbulb {
            width: 100px;
            height: 150px;
            background-image: url('lightbulb.png'); /* Replace with your lightbulb image file */
            background-size: cover;
            margin: 20px;
        }
        button {
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
    </style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Light Bulb Simulator</title>
    <style>
        #lightbulb {
            width: 100px;
            height: 150px;
            background: url('lightbulb.png') no-repeat center center; /* Replace with your lightbulb image file */
            background-size: contain;
            margin: 20px;
        }
        button {
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div id="lightbulb"></div>

<button onclick="incrementState()">+1</button>
<button onclick="decrementState()">-1</button>
<button onclick="turnOn()">Turn On</button>
<button onclick="turnOff()">Turn Off</button>

<script>
    let lightbulbState = 0;  // 0 for Off, 1 for On
    const lightbulb = document.getElementById('lightbulb');

    function updateLightbulb() {
        if (lightbulbState === 1) {
            lightbulb.style.background = "url('lightbulb.png') no-repeat center center";  // Replace with your lightbulb image file
        } else {
            lightbulb.style.background = "none";
        }
    }

    function incrementState() {
        lightbulbState += 1;
        updateLightbulb();
    }

    function decrementState() {
        if (lightbulbState > 0) {
            lightbulbState -= 1;
            updateLightbulb();
        }
    }

    function turnOn() {
        lightbulbState = 1;
        updateLightbulb();
    }

    function turnOff() {
        lightbulbState = 0;
        updateLightbulb();
    }
</script>

</body>
</html>

