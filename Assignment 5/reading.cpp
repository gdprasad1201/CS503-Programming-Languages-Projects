#include "reading.h"

#include <algorithm>
#include <fstream>
#include <functional>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

#include "Box.h"
#include "Cylinder.h"
#include "Shape.h"
#include "Sphere.h"
#include "Torus.h"

using namespace std;

vector<Shape *> *readFrom(string filename) {
    ifstream file(filename);

    if (!file.is_open()) {
        cout << "Error: file not found" << endl;
        return nullptr;
    }

    if (file.peek() == ifstream::traits_type::eof()) {
        cout << "Error: file is empty" << endl;
        return nullptr;
    }

    vector<Shape *> *shapes = new vector<Shape *>;
    string line, type, name;

    while (getline(file, line)) {
        istringstream iss(line);

        iss >> name >> type;

        if (type == "box") {
            double length, width, height;
            iss >> length >> width >> height;
            shapes->push_back(new Box(name, length, width, height));
        } else if (type == "cylinder") {
            double radius, height;
            iss >> radius >> height;
            shapes->push_back(new Cylinder(name, radius, height));
        } else if (type == "sphere") {
            double radius;
            iss >> radius;
            shapes->push_back(new Sphere(name, radius));
        } else if (type == "torus") {
            double minorRadius, majorRadius;
            iss >> minorRadius >> majorRadius;
            shapes->push_back(new Torus(name, majorRadius, minorRadius));
        }
    }

    file.close();

    return shapes;
}