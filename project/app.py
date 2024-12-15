from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import random

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tasks.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Database model
class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String(200), nullable=False)
    completed = db.Column(db.Boolean, default=False)
    date_created = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f'Task({self.content}, {self.completed})'

# List of funny messages
funny_messages = [
    "🎉 You did it! The laundry monster has been defeated!",
    "🚀 Task completed! You’re one step closer to world domination!",
    "🥳 Congrats! You just unlocked a new level of productivity!",
    "💪 You crushed that task like a boss!",
    "🎈 Hooray! Another task bites the dust!",
]

# Create the database and the database table
with app.app_context():
    db.create_all()

@app.route('/')
def index():
    tasks = Task.query.all()
    message = None  # Ensure message is defined
    return render_template('index.html', tasks=tasks, message=message)


@app.route('/add', methods=['POST'])
def add():
    task_content = request.form.get('content')
    if task_content:
        new_task = Task(content=task_content)
        db.session.add(new_task)
        db.session.commit()
    return redirect('/')

@app.route('/complete/<int:task_id>')
def complete(task_id):
    task = Task.query.get(task_id)
    if task:
        task.completed = True
        db.session.commit()
        message = random.choice(funny_messages)  # Get a random funny message
        tasks = Task.query.all()  # Get the updated tasks
        return render_template('index.html', tasks=tasks, message=message)
    return redirect('/')


@app.route('/delete/<int:task_id>')
def delete(task_id):
    task = Task.query.get(task_id)
    if task:
        db.session.delete(task)
        db.session.commit()
    return redirect('/')

@app.route('/api/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    return jsonify([{'id': task.id, 'content': task.content, 'completed': task.completed} for task in tasks])

if __name__ == '__main__':
    app.run(debug=True)
