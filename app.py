from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return """ 
    <!DOCTYPE html>
    <html>
    <head>
        <title>My Flask App</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #6ea0bf;
                text-align: center;
                padding: 50px;
            }
            h1 {
                color: #333;
            }
            p {
                font-size: 18px;
                color: #555;
            }
            .container {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>This is a Simple Flask Application</h1>
        </div>
    </body>
    </html>
    """

if __name__ == '__main__':
    app.run(debug=True)
