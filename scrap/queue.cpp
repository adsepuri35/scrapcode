#include <algorithm>
#include <iostream>
#include <stdexcept>

using namespace std;

class Queue {
    public:
        struct Node {
            int val;
            Node* next;
        };
        Node* head;
        Node* tail;
        int size;
        Queue() {
            size = 0;
        }
        void enqueue(int value) {
            Node* newNode = new Node();
            newNode->val = value;
            newNode->next = NULL;
            if (size == 0 || head == NULL) {
                head = newNode;
                tail = newNode;
            } else {
                tail->next = newNode;
                tail = tail->next;
            }
            size++;
        }
        int getHead() {
            if (size <= 0) {
                throw runtime_error("empty_queue");
            }
            return head->val;
        }
        int dequeue() {
            if (size <= 0) {
                throw runtime_error("empty_queue");
            }
            int headVal = head->val;
            head = head->next;
            size--;
            return headVal;
        }
        void clearQueue() {
            size = 0;
            head = NULL;
            tail = NULL;
        }
        int getSize() {
            return size;
        }

    private:
};

int main() {
    Queue q;
    for (int i = 1; i <= 10; i++) {
        q.enqueue(i);
        cout << "head = " << q.getHead() << endl;
    }
    
    cout << "size = " << q.getSize() << endl;
    q.dequeue();
    cout << "Dequeue" << endl;
    cout << "head = " << q.getHead() << endl;
    for (int i = 0; i < 10; i++) {
        cout << "Dequeue" << endl;
        q.dequeue();
        cout << "head = " << q.getHead() << endl;
    }

    return 0;
}