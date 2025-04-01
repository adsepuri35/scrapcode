#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char* name;
    int id;
    float gpa;
} Student;

void addStudent(Student** students, int* count);
void deleteStudent(Student* students, int* count, int id);
void displayStudents(Student** students, int* count);
void freeStudents(Student** students, int* count);

int main() {
    Student* students = NULL;
    int count = 0;
    int choice;

    while (1) {
        // Display menu
        printf("\nMenu:\n");
        printf("1. Add a new student\n");
        printf("2. Delete a student by ID\n");
        printf("3. Display all students\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        // Handle menu choices
        switch (choice) {
            case 1:
                addStudent(&students, &count);
                break;
            case 2: {
                int id;
                printf("Enter the ID of the student to delete: ");
                scanf("%d", &id);
                deleteStudent(&students, &count, id);
                break;
            }
            case 3:
                displayStudents(students, count);
                break;
            case 4:
                freeStudents(students, count);
                printf("Exiting program. Goodbye!\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

void addStudent(Student** students, int* count) {
    *students = realloc(*students, (*count + 1) * sizeof(Student));
    if (*students == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }

    Student* newStudent = &(*students)[*count];
    newStudent->name = malloc(100 * sizeof(char));
    if (newStudent->name == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }

    printf("Enter student name: ");
    scanf(" %[^\n]", newStudent->name);  // Read a string with spaces
    printf("Enter student ID: ");
    scanf("%d", &newStudent->id);
    printf("Enter student GPA: ");
    scanf("%f", &newStudent->gpa);

    (*count)++;
    printf("Student added successfully!\n");
}

void deleteStudent(Student** students, int* count, int id) {
    int found = 0;
    for (int i = 0; i < *count; i++) {
        if ((*students)[i].id == id) {
            found = 1;
            free((*students)[id].name);
        }
    }

    if (!found) printf("No student found with given ID");
}