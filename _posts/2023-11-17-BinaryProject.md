---
comments: True
layout: post
toc: True
title: Binary password encrypter/decrypter
description: Our Binary Project
type: hacks
courses: { "compsci": { "week": 2 } }
---

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
