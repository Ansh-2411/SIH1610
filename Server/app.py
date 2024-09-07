from flask import Flask, render_template, request, url_for, redirect, jsonify
import pymysql
import numpy as np
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.keras.preprocessing import image
from tensorflow.keras.models import load_model

app = Flask(__name__)

timeout = 10
conn = pymysql.connect(
    charset="utf8mb4",
    connect_timeout=timeout,
    cursorclass=pymysql.cursors.DictCursor,
    db="edusign",
    host="localhost",
    password="",
    read_timeout=timeout,
    user="root",
    write_timeout=timeout,
)

c = conn.cursor()

@app.route('/')
def hello_world():
    c.execute('''SELECT * FROM Students;''')
    data = c.fetchall()
    return jsonify({"message": "hello", "data": data})


# student----
@app.route('/get/students', methods=['GET'])
def get_students():
    c.execute('''SELECT * FROM Students;''')
    data = c.fetchall()
    return jsonify({"message": "Students retrieved successfully", "data": data})

@app.route('/add/students', methods=['POST'])
def add_student():
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "date_of_birth": data['date_of_birth'],
        "gender": data['gender'],
        "address": data['address'],
        "phone_number": data['phone_number'],
        "assigned_teacher_id": data['assigned_teacher_id'],
        "parent_id": data['parent_id']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' INSERT INTO Students ({columns}) VALUES ({placeholders}) ''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Student added successfully"}), 201

@app.route('/get/students/<int:student_id>', methods=['GET'])
def get_student(student_id):
    c.execute('''SELECT * FROM Students WHERE student_id = %s;''', (student_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Student retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Student not found"}), 404

@app.route('/update/students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "date_of_birth": data['date_of_birth'],
        "gender": data['gender'],
        "address": data['address'],
        "phone_number": data['phone_number'],
        "assigned_teacher_id": data['assigned_teacher_id'],
        "parent_id": data['parent_id']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' UPDATE Students SET {columns} = {placeholders} WHERE student_id = %s ''', list(values.values()) + [student_id])
    conn.commit()
    return jsonify({"message": "Student updated successfully"}), 200

@app.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    c.execute('''DELETE FROM Students WHERE student_id = %s;''', (student_id,))
    conn.commit()
    return jsonify({"message": "Student deleted successfully"}), 200

# attendence
@app.route('/attendance', methods=['GET'])
def get_attendance_records():
    c.execute('''SELECT * FROM AttendanceRecord;''')
    data = c.fetchall()
    return jsonify({"message": "Attendance records retrieved successfully", "data": data})

@app.route('/attendance', methods=['POST'])
def add_attendance_record():
    data = request.json
    values = {
        "student_id": data['student_id'],
        "date": data['date'],
        "status": data['status'],
        "remark": data['remark']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' INSERT INTO AttendanceRecord ({columns}) VALUES ({placeholders}) ''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Attendance record added successfully"}), 201

@app.route('/attendance/<int:record_id>', methods=['GET'])
def get_attendance_record(record_id):
    c.execute('''SELECT * FROM AttendanceRecord WHERE record_id = %s;''', (record_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Attendance record retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Attendance record not found"}), 404

@app.route('/attendance/<int:record_id>', methods=['PUT'])
def update_attendance_record(record_id):
    data = request.json
    values = {
        "student_id": data['student_id'],
        "date": data['date'],
        "status": data['status'],
        "remark": data['remark']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' UPDATE AttendanceRecord SET {columns} = {placeholders} WHERE record_id = %s ''', list(values.values()) + [record_id])
    conn.commit()
    return jsonify({"message": "Attendance record updated successfully"}), 200

# teacher
# Teacher CRUD Operations

# Get all teachers
@app.route('/get/teachers', methods=['GET'])
def get_teachers():
    c.execute('''SELECT * FROM Teachers;''')
    data = c.fetchall()
    return jsonify({"message": "Teachers retrieved successfully", "data": data})

# Add a new teacher
@app.route('/add/teachers', methods=['POST'])
def add_teacher():
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "subject_taught": data['subject_taught']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' INSERT INTO Teachers ({columns}) VALUES ({placeholders}) ''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Teacher added successfully"}), 201

# Get a specific teacher by ID
@app.route('/get/teachers/<int:teacher_id>', methods=['GET'])
def get_teacher(teacher_id):
    c.execute('''SELECT * FROM Teachers WHERE teacher_id = %s;''', (teacher_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Teacher retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Teacher not found"}), 404
# get students for specific students
@app.route('/get/students/by_teacher/<int:teacher_id>', methods=['GET'])
def get_students_by_teacher(teacher_id):
    # SQL query to fetch students assigned to the given teacher ID
    query = '''SELECT * FROM Students WHERE assigned_teacher_id = %s;'''
    c.execute(query, (teacher_id,))
    data = c.fetchall()
    
    if data:
        return jsonify({"message": "Students retrieved successfully", "data": data})
    else:
        return jsonify({"message": "No students found for the given teacher ID"}), 404


# Update a teacher by ID
@app.route('/update/teachers/<int:teacher_id>', methods=['PUT'])
def update_teacher(teacher_id):
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "subject_taught": data['subject_taught']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f''' UPDATE Teachers SET {placeholders} WHERE teacher_id = %s ''', list(values.values()) + [teacher_id])
    conn.commit()
    return jsonify({"message": "Teacher updated successfully"}), 200

# Delete a teacher by ID
@app.route('/delete/teachers/<int:teacher_id>', methods=['DELETE'])
def delete_teacher(teacher_id):
    c.execute('''DELETE FROM Teachers WHERE teacher_id = %s;''', (teacher_id,))
    conn.commit()
    return jsonify({"message": "Teacher deleted successfully"}), 200


# parents

# Parent CRUD Operations

# Get all parents
@app.route('/get/parents', methods=['GET'])
def get_parents():
    c.execute('''SELECT * FROM Parents;''')
    data = c.fetchall()
    return jsonify({"message": "Parents retrieved successfully", "data": data})

# Add a new parent
@app.route('/add/parents', methods=['POST'])
def add_parent():
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "phone_number": data['phone_number'],
        "children": data['children']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f''' INSERT INTO Parents ({columns}) VALUES ({placeholders}) ''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Parent added successfully"}), 201

# Get a specific parent by ID
@app.route('/get/parents/<int:parent_id>', methods=['GET'])
def get_parent(parent_id):
    c.execute('''SELECT * FROM Parents WHERE parent_id = %s;''', (parent_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Parent retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Parent not found"}), 404

# Update a parent by ID
@app.route('/update/parents/<int:parent_id>', methods=['PUT'])
def update_parent(parent_id):
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password'],
        "phone_number": data['phone_number'],
        "children": data['children']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f''' UPDATE Parents SET {placeholders} WHERE parent_id = %s ''', list(values.values()) + [parent_id])
    conn.commit()
    return jsonify({"message": "Parent updated successfully"}), 200

# Delete a parent by ID
@app.route('/delete/parents/<int:parent_id>', methods=['DELETE'])
def delete_parent(parent_id):
    c.execute('''DELETE FROM Parents WHERE parent_id = %s;''', (parent_id,))
    conn.commit()
    return jsonify({"message": "Parent deleted successfully"}), 200


# HR CRUD Operations

# Get all HR records
@app.route('/get/hr', methods=['GET'])
def get_all_hr():
    c.execute('''SELECT * FROM HR;''')
    data = c.fetchall()
    return jsonify({"message": "HR records retrieved successfully", "data": data})

# Add a new HR record
@app.route('/add/hr', methods=['POST'])
def add_hr():
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f'''INSERT INTO HR ({columns}) VALUES ({placeholders})''', list(values.values()))
    conn.commit()
    return jsonify({"message": "HR record added successfully"}), 201

# Get a specific HR record by ID
@app.route('/get/hr/<int:hr_id>', methods=['GET'])
def get_hr(hr_id):
    c.execute('''SELECT * FROM HR WHERE hr_id = %s;''', (hr_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "HR record retrieved successfully", "data": data})
    else:
        return jsonify({"message": "HR record not found"}), 404

# Update a HR record by ID
@app.route('/update/hr/<int:hr_id>', methods=['PUT'])
def update_hr(hr_id):
    data = request.json
    values = {
        "first_name": data['first_name'],
        "last_name": data['last_name'],
        "email": data['email'],
        "password": data['password']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f'''UPDATE HR SET {placeholders} WHERE hr_id = %s''', list(values.values()) + [hr_id])
    conn.commit()
    return jsonify({"message": "HR record updated successfully"}), 200

# Delete a HR record by ID
@app.route('/delete/hr/<int:hr_id>', methods=['DELETE'])
def delete_hr(hr_id):
    c.execute('''DELETE FROM HR WHERE hr_id = %s;''', (hr_id,))
    conn.commit()
    return jsonify({"message": "HR record deleted successfully"}), 200

# Assignments CRUD Operations

# Get all assignment records
@app.route('/get/assignments', methods=['GET'])
def get_all_assignments():
    c.execute('''SELECT * FROM Assignments;''')
    data = c.fetchall()
    return jsonify({"message": "Assignments retrieved successfully", "data": data})

# Add a new assignment record
@app.route('/add/assignment', methods=['POST'])
def add_assignment():
    data = request.json
    values = {
        "title": data['title'],
        "description": data['description'],
        "due_date": data['due_date'],
        "uploaded_by": data['uploaded_by']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f'''INSERT INTO Assignments ({columns}) VALUES ({placeholders})''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Assignment added successfully"}), 201

# Get a specific assignment record by ID
@app.route('/get/assignment/<int:assignment_id>', methods=['GET'])
def get_assignment(assignment_id):
    c.execute('''SELECT * FROM Assignments WHERE assignment_id = %s;''', (assignment_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Assignment retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Assignment not found"}), 404

# Update an assignment record by ID
@app.route('/update/assignment/<int:assignment_id>', methods=['PUT'])
def update_assignment(assignment_id):
    data = request.json
    values = {
        "title": data['title'],
        "description": data['description'],
        "due_date": data['due_date'],
        "uploaded_by": data['uploaded_by']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f'''UPDATE Assignments SET {placeholders} WHERE assignment_id = %s''', list(values.values()) + [assignment_id])
    conn.commit()
    return jsonify({"message": "Assignment updated successfully"}), 200

# Delete an assignment record by ID
@app.route('/delete/assignment/<int:assignment_id>', methods=['DELETE'])
def delete_assignment(assignment_id):
    c.execute('''DELETE FROM Assignments WHERE assignment_id = %s;''', (assignment_id,))
    conn.commit()
    return jsonify({"message": "Assignment deleted successfully"}), 200



# SignLanguageTutorials CRUD Operations

# Get all tutorials
@app.route('/get/signlanguage/tutorials', methods=['GET'])
def get_all_tutorials():
    c.execute('''SELECT * FROM SignLanguageTutorials;''')
    data = c.fetchall()
    return jsonify({"message": "Sign language tutorials retrieved successfully", "data": data})

# Add a new tutorial
@app.route('/add/signlanguage/tutorial', methods=['POST'])
def add_tutorial():
    data = request.json
    values = {
        "title": data['title'],
        "content": data['content'],
        "video_link": data['video_link'],
        "difficulty_level": data['difficulty_level']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f'''INSERT INTO SignLanguageTutorials ({columns}) VALUES ({placeholders})''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Sign language tutorial added successfully"}), 201

# Get a specific tutorial by ID
@app.route('/get/signlanguage/tutorial/<int:tutorial_id>', methods=['GET'])
def get_tutorial(tutorial_id):
    c.execute('''SELECT * FROM SignLanguageTutorials WHERE tutorial_id = %s;''', (tutorial_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Sign language tutorial retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Sign language tutorial not found"}), 404

# Update a tutorial by ID
@app.route('/update/signlanguage/tutorial/<int:tutorial_id>', methods=['PUT'])
def update_tutorial(tutorial_id):
    data = request.json
    values = {
        "title": data['title'],
        "content": data['content'],
        "video_link": data['video_link'],
        "difficulty_level": data['difficulty_level']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f'''UPDATE SignLanguageTutorials SET {placeholders} WHERE tutorial_id = %s''', list(values.values()) + [tutorial_id])
    conn.commit()
    return jsonify({"message": "Sign language tutorial updated successfully"}), 200

# Delete a tutorial by ID
@app.route('/delete/signlanguage/tutorial/<int:tutorial_id>', methods=['DELETE'])
def delete_tutorial(tutorial_id):
    c.execute('''DELETE FROM SignLanguageTutorials WHERE tutorial_id = %s;''', (tutorial_id,))
    conn.commit()
    return jsonify({"message": "Sign language tutorial deleted successfully"}), 200


# SignLanguageRecognition CRUD Operations

# Get all recognition records
@app.route('/get/signlanguage/recognition', methods=['GET'])
def get_all_recognition_records():
    c.execute('''SELECT * FROM SignLanguageRecognition;''')
    data = c.fetchall()
    return jsonify({"message": "Sign language recognition records retrieved successfully", "data": data})

# Add a new recognition record
@app.route('/add/signlanguage/recognition', methods=['POST'])
def add_recognition_record():
    data = request.json
    values = {
        "student_id": data['student_id'],
        "sign_captured": data['sign_captured'],
        "recognized_text": data['recognized_text'],
        "recognized_speech": data['recognized_speech']
    }
    placeholders = ', '.join(['%s'] * len(values))
    columns = ', '.join(values.keys())
    c.execute(f'''INSERT INTO SignLanguageRecognition ({columns}) VALUES ({placeholders})''', list(values.values()))
    conn.commit()
    return jsonify({"message": "Sign language recognition record added successfully"}), 201

# Get a specific recognition record by ID
@app.route('/get/signlanguage/recognition/<int:record_id>', methods=['GET'])
def get_recognition_record(record_id):
    c.execute('''SELECT * FROM SignLanguageRecognition WHERE record_id = %s;''', (record_id,))
    data = c.fetchone()
    if data:
        return jsonify({"message": "Sign language recognition record retrieved successfully", "data": data})
    else:
        return jsonify({"message": "Sign language recognition record not found"}), 404

# Update a recognition record by ID
@app.route('/update/signlanguage/recognition/<int:record_id>', methods=['PUT'])
def update_recognition_record(record_id):
    data = request.json
    values = {
        "student_id": data['student_id'],
        "sign_captured": data['sign_captured'],
        "recognized_text": data['recognized_text'],
        "recognized_speech": data['recognized_speech']
    }
    placeholders = ', '.join([f"{key} = %s" for key in values.keys()])
    c.execute(f'''UPDATE SignLanguageRecognition SET {placeholders} WHERE record_id = %s''', list(values.values()) + [record_id])
    conn.commit()
    return jsonify({"message": "Sign language recognition record updated successfully"}), 200

# Delete a recognition record by ID
@app.route('/delete/signlanguage/recognition/<int:record_id>', methods=['DELETE'])
def delete_recognition_record(record_id):
    c.execute('''DELETE FROM SignLanguageRecognition WHERE record_id = %s;''', (record_id,))
    conn.commit()
    return jsonify({"message": "Sign language recognition record deleted successfully"}), 200


@app.route('/signlanguage/prediction', methods=['GET'])
def signlanguage_prediction():
    model2 = load_model("asl.h5")
    class_labels = '0123456789abcdefghijklmnopqrstuvwxyz'

    def preprocess_image(image_path):
        img = load_img(image_path, target_size=(224,224))  
        img_array = img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)  
        return img_array

    def classify_image(image_path):
        img_array = preprocess_image(image_path)
        prediction = model2.predict(img_array)
        predicted_class = np.argmax(prediction)
        predicted_label = class_labels[predicted_class]  
        return predicted_label
    image_path = 'saved_image.jpeg'  
    predicted_label = classify_image(image_path)
    print(f'The predicted label for the input image is: {predicted_label}')
    img = load_img(image_path)

    return jsonify({"message": predicted_label}), 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=1000, debug=True)