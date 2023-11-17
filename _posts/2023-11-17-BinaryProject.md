---
comments: True
layout: post
toc: True
title: Binary Project
description: Our Binary Project
type: hacks
courses: { "compsci": { "week": 2 } }
---

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
