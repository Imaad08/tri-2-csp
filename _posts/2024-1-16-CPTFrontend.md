<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meme Database</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <style>
        body {
            background-color: #f8f8f8;
            color: #333;
            font-family: 'Montserrat', sans-serif; /* Updated font-family */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Set minimum height to full viewport height */
        }

        header {
            background-color: #11115e;
            color: #fff;
            text-align: center;
            padding: 20px;
            font-size: 28px;
        }

        nav {
            background-color: #efc2f4;
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 18px;
        }

        section {
            margin: 20px;
            text-align: center;
            flex: 1; /* Expand and take remaining space */
        }

        .meme-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .meme {
            max-width: 300px;
            border: 2px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
        }

        footer {
            background-color: #ffd600; /* Yellow footer background */
            color: #333; /* Dark text color */
            text-align: center;
            padding: 20px;
            width: 100%;
        }
    </style>
</head>
<body>

    <header>
        <h1>Meme Database</h1>
    </header>

    <nav>
        <a href="#">Home</a> |
        <a href="#">Browse</a> |
        <a href="#">Make a Meme</a>
    </nav>

    <section>
        <h2>Welcome to the Meme Database!</h2>
        <p>Explore a collection of hilarious memes in a stylish and aesthetic environment.</p>
        
        <div class="meme-container">
            <!-- Sample meme entries -->
            <div class="meme">
                <img src="https://placekitten.com/300/200" alt="Meme 1">
            </div>
            <div class="meme">
                <img src="https://placekitten.com/301/200" alt="Meme 2">
            </div>
            <div class="meme">
                <img src="https://placekitten.com/302/200" alt="Meme 3">
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Meme Database. All rights reserved.</p>
    </footer>

</body>
</html>
