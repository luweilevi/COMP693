from flask import Flask
from app.user import user_bp
from app.observer import observer_bp
from app.operator import operator_bp
from app.admin import admin_bp
from app.shared import shared_bp
from app.analytics.group_dashboard import group_bp
from app.analytics.super_admin_dashboard import super_admin_bp
from app.location import location_bp
from app.donations import donations_bp
from app.updates import updates_bp
from app.knowledge import knowledge_bp
# Starts the Flask application.
app = Flask(__name__, template_folder="app/templates", static_folder="app/static")

@app.after_request
def add_header(response):
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response

app.secret_key = "your_secret_key"

app.register_blueprint(user_bp)
app.register_blueprint(observer_bp)
app.register_blueprint(operator_bp)
app.register_blueprint(admin_bp)
app.register_blueprint(shared_bp)
app.register_blueprint(group_bp)
app.register_blueprint(super_admin_bp)
app.register_blueprint(location_bp)
app.register_blueprint(donations_bp)
app.register_blueprint(updates_bp)
app.register_blueprint(knowledge_bp)

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)