from flask import Flask, request, render_template, send_from_directory

app = Flask(__name__, static_folder='public')

def decimal_to_binary(num):
    if num == 0:
        return '0'

    binary = []
    num = abs(int(num))

    while num > 0:
        binary.insert(0, str(num % 2))
        num //= 2

    return ''.join(binary)

@app.route('/')
def index():
    return send_from_directory('public', 'index.html')

@app.route('/styles.css')
def styles():
    return send_from_directory('public', 'styles.css')

@app.route('/convert', methods=['POST'])
def convert():
    try:
        number = int(request.form['number'])
        binary = decimal_to_binary(number)
        return f'Binary: {binary}'
    except ValueError:
        return 'Invalid input', 400

if __name__ == '__main__':
    app.run(port=1337, host='127.0.0.1')
