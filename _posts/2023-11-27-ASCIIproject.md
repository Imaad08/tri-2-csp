---
comments: True
layout: post
toc: True
title: ASCII Project
description: Our ASCII project to convert images to ASCII text art
type: hacks
courses: { "compsci": { "week": 2 } }
---

<head>
  <!-- Meta tags for character set and viewport settings -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title of the HTML document -->
  <title>Image to ASCII Art</title>
  <!-- Styling for the document -->
  <style>
    /* Flex container styling for body */
    body {
      display: flex;
      flex-direction: column;
      margin: 20px;
    }
    .container {
        width: 3000px
    }
    /* Styling for the canvas element */
    canvas {
      border: 1px solid #000;
      margin-top: 20px;
      width: 100%; /* Make the canvas element fill its container */
      max-width: 2000px; /* Set a maximum width for larger screens */
    }
  </style>
</head>

<body>
  <!-- Header for the application -->
  <h1>Image to ASCII Art Converter</h1>
  <!-- Input element for selecting an image file -->
  <input type="file" id="imageInput" accept="image/*">
  <!-- Canvas element to display the image and ASCII art -->
  <canvas id="asciiCanvas"></canvas>
  <!-- Pre element to display the generated ASCII art text -->
  <pre class="container" id="asciiArt"></pre>

  <!-- JavaScript section -->
  <script>
    // Add an event listener to the file input to trigger handleImage function on file selection
    document.getElementById('imageInput').addEventListener('change', handleImage);

    // Function to handle the selected image
    function handleImage() {
      // Get references to the input, canvas, and pre elements
      const input = document.getElementById('imageInput');
      const canvas = document.getElementById('asciiCanvas');
      const asciiArt = document.getElementById('asciiArt');
      const ctx = canvas.getContext('2d');

      // Create an Image object and set its source to the selected image file
      const img = new Image();
      img.src = URL.createObjectURL(input.files[0]);

      // Set up an onload event for the image, executed when the image is loaded
      img.onload = function () {
        // Set canvas dimensions to match the image
        canvas.width = img.width;
        canvas.height = img.height;
        // Draw the image onto the canvas
        ctx.drawImage(img, 0, 0);

        // Get image data from the canvas
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height).data;
        // Generate ASCII art text from the image data
        const asciiText = generateAsciiArt(imageData, canvas.width);
        // Display the ASCII art text in the pre element
        asciiArt.innerText = asciiText;
      };
    }

    // Function to generate ASCII art from image data
    function generateAsciiArt(imageData, width) {
      // ASCII characters used to represent different pixel intensities
      const asciiChars = '@%#*+=-:.';
      // Initialize an empty string to store the ASCII art text
      let asciiText = '';

      // Loop through each pixel in the image data
      for (let i = 0; i < imageData.length; i += 4) {
        // Calculate the average intensity of the RGB values for the pixel
        const avg = (imageData[i] + imageData[i + 1] + imageData[i + 2]) / 3;
        // Map the average intensity to an index in the ASCII characters array
        const index = Math.floor((avg / 255) * (asciiChars.length - 1));
        // Append the corresponding ASCII character to the text
        asciiText += asciiChars[index];

        // Add a line break if the end of a row is reached
        if ((i + 4) % (width * 4) === 0) {
          asciiText += '\n';
        }
      }

      // Return the generated ASCII art text
      return asciiText;
    }
  </script>

</body>

First, we collect an image from the user. Then, we use ASCII characters to represent the different pixel intensities in the image. Then, we loop through each pixel and find the average intensity of each pixel. Then we add the ASCII character to a text and add a line break when the end of a row is reached. Then we display the ASCII art text.

```python
    // Add an event listener to the file input to trigger handleImage function on file selection
    document.getElementById('imageInput').addEventListener('change', handleImage);

    // Function to handle the selected image
    function handleImage() {
      // Get references to the input, canvas, and pre elements
      const input = document.getElementById('imageInput');
      const canvas = document.getElementById('asciiCanvas');
      const asciiArt = document.getElementById('asciiArt');
      const ctx = canvas.getContext('2d');

      // Create an Image object and set its source to the selected image file
      const img = new Image();
      img.src = URL.createObjectURL(input.files[0]);

      // Set up an onload event for the image, executed when the image is loaded
      img.onload = function () {
        // Set canvas dimensions to match the image
        canvas.width = img.width;
        canvas.height = img.height;
        // Draw the image onto the canvas
        ctx.drawImage(img, 0, 0);

        // Get image data from the canvas
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height).data;
        // Generate ASCII art text from the image data
        const asciiText = generateAsciiArt(imageData, canvas.width);
        // Display the ASCII art text in the pre element
        asciiArt.innerText = asciiText;
      };
    }

    // Function to generate ASCII art from image data
    function generateAsciiArt(imageData, width) {
      // ASCII characters used to represent different pixel intensities
      const asciiChars = '@%#*+=-:.';
      // Initialize an empty string to store the ASCII art text
      let asciiText = '';

      // Loop through each pixel in the image data
      for (let i = 0; i < imageData.length; i += 4) {
        // Calculate the average intensity of the RGB values for the pixel
        const avg = (imageData[i] + imageData[i + 1] + imageData[i + 2]) / 3;
        // Map the average intensity to an index in the ASCII characters array
        const index = Math.floor((avg / 255) * (asciiChars.length - 1));
        // Append the corresponding ASCII character to the text
        asciiText += asciiChars[index];

        // Add a line break if the end of a row is reached
        if ((i + 4) % (width * 4) === 0) {
          asciiText += '\n';
        }
      }

      // Return the generated ASCII art text
      return asciiText;
    }
    ```

    
