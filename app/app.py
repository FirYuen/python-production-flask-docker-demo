from flask import Flask
from flask import jsonify
from flask import request
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s-%(filename)s-%(funcName)s-[line:%(lineno)d]'
                              '-%(levelname)s: %(message)s',
                              datefmt='%m-%d %H:%M:%S')
ch.setFormatter(formatter)
logger.addHandler(ch)

app = Flask(__name__)

@app.route('/',methods=['post','get'])
def hello():
    logger.info("hello world")
    return jsonify({
        'hello': 'world'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0')

