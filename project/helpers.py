from datetime import datetime

def calculate_points(task_content):
    return 10  # Simple points system, 10 points per task (customize this!)

def update_streak(user):
    now = datetime.utcnow()
    if user.last_active and (now - user.last_active).days == 1:
        user.streak += 1
    elif (now - user.last_active).days > 1:
        user.streak = 0
    user.last_active = now
