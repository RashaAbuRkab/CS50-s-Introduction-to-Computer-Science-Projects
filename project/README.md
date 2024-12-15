### To-Do List Web Application 📝
#### Video Demo:  <https://youtu.be/5XczL4PrmwQ?feature=shared>
## Description
The To-Do List Web Application is a fun and interactive web-based tool designed to make task management enjoyable. This application allows users to add, manage, and complete tasks with a playful twist. Featuring humorous messages, engaging animations, and a whimsical design, it transforms the mundane task of organizing to-dos into an entertaining experience. The app categorizes tasks into "In Progress" and "Completed" sections, providing a clear visual representation of your progress.

## Features

* Add Tasks: Easily add new tasks to your to-do list through a user-friendly interface.
* Mark as Complete: Click to mark tasks as completed, triggering fun animations and displaying random funny messages.
* Delete Tasks: Remove tasks that are no longer needed with a simple click.
* Interactive Animations: Enjoy a "happy dance" animation upon completing tasks, adding a celebratory feel.
* Humorous Messages: Receive random, amusing messages every time you complete a task to keep you motivated.
* Responsive Design: The application is mobile-friendly and adjusts seamlessly to different screen sizes.
* Playful Interface: A vibrant color scheme, playful fonts, and decorative elements like floating clouds enhance the user experience.

## Files and Structure
# Main Application Files
# app.py:
The core of the application. This Flask file contains all backend logic, including route definitions, database interactions, and the logic for displaying funny messages upon task completion.
# Templates
- templates/layout.html: The base HTML template that sets up the structure of the web pages. It includes the header, main container, and placeholders for dynamic content.
- templates/index.html: Extends layout.html and populates the content block with the task input form, task lists, and scripts for message display.
# Static Files
- static/styles.css: Contains all CSS styles for the application, including layouts, colors, fonts, and animations. It styles the main container, buttons, task lists, and background elements like clouds.
- static/script.js: Houses JavaScript code for interactive elements such as playing sound effects and triggering animations when tasks are completed.
# Additional Modules
- config.py: Holds configuration settings for the application, such as the database URI and secret key.
- helper.py: Contains helper functions for additional features like calculating points or updating streaks (if implemented).
- modules.py: Defines database models using SQLAlchemy, such as the Task class.
- requirements.txt: Lists all Python packages and dependencies required to run the application.
