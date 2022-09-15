from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class MJZ_study(Resource):
    def get(self):
        return {
            'MJZ_instructors': ['Zain',
                    'Mohsin',
                    'Junaid',
                    'Tanveer']
        }
api.add_resource(MJZ_study, '/')
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug = True)
