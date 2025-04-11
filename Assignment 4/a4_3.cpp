#include <iostream>
#include <stdio.h>
#include "a4_3.h"

using namespace std;

int main() {
    int intArraySize, targetInt, floatArraySize;
    float targetFloat;

    string choice;
    cout << "Enter the type of array you want to search (int/float): ";
    cin >> choice;

    if (choice == "int") {
        cout << "Enter the size of the array: ";
        cin >> intArraySize;

        int intArray[intArraySize];
        cout << "Enter the elements of the array: ";
        for (int i = 0; i < intArraySize; i++) {
            cin >> intArray[i];
        }

        cout << "Enter the target integer: ";
        cin >> targetInt;

        cout << "The target integer is at index " << genericSearch(intArray, intArraySize, targetInt) << endl;
    }
    else if (choice == "float") {
        cout << "Enter the size of the array: ";
        cin >> floatArraySize;
        
        float floatArray[floatArraySize];
        cout << "Enter the elements of the array: ";
        for (int i = 0; i < floatArraySize; i++) {
            cin >> floatArray[i];
        }
        cout << "Enter the target float: ";
        cin >> targetFloat;
        cout << "The target float is at index " << genericSearch(floatArray, floatArraySize, targetFloat) << endl;
    }
    
    return 0;
}