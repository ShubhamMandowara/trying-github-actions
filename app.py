from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/process', methods=['POST'])
def process_text():
    data = request.get_json()
    if not data or 'text' not in data:
        return jsonify({'error': 'No text provided'}), 400
    processed_text = f'hello {data['text']}'
    return jsonify({'result', processed_text})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
