#include "Box.h"

#include <algorithm>
#include <string>

using namespace std;

Box::Box(string name, double length, double width, double height)
    : Shape("box") {
    this->name = name;
    this->length = length;
    this->width = width;
    this->height = height;
}

double Box::getLength() const { return length; }

double Box::getWidth() const { return width; }

double Box::getHeight() const { return height; }

string Box::getName() const { return name; }

double Box::getArea() const {
    return 2 * (length * width + length * height + width * height);
}

double Box::getVolume() const { return length * width * height; }

string Box::getInfo() const {
    ostringstream oss;
    oss << "Box: " << name << ", Length=" << length << ", Width=" << width
        << ", Height=" << height << "\n"
        << "\tSurface Area: " << this->getArea()
        << ", Volume: " << this->getVolume();
    return oss.str();
}

bool Box::test(const vector<string>& cond) const {
    if (cond.empty()) {
        return true;
    }

    bool res, finalRes = true;

    for (int i = 0; i < cond.size(); i += 3) {
        string condition = cond[i], op = cond[i + 1], value = cond[i + 2];
        if (condition == "type") {
            if (op == "==") {
                res = shapeType == value;
            } else if (op == "!=") {
                res = shapeType != value;
            } else if (op == ">") {
                res = shapeType > value;
            } else if (op == "<") {
                res = shapeType < value;
            } else if (op == ">=") {
                res = shapeType >= value;
            } else if (op == "<=") {
                res = shapeType <= value;
            }
        } else if (condition == "area") {
            if (op == "==") {
                res = this->getArea() == stod(value);
            } else if (op == "!=") {
                res = this->getArea() != stod(value);
            } else if (op == ">") {
                res = this->getArea() > stod(value);
            } else if (op == "<") {
                res = this->getArea() < stod(value);
            } else if (op == ">=") {
                res = this->getArea() >= stod(value);
            } else if (op == "<=") {
                res = this->getArea() <= stod(value);
            }
        } else if (condition == "volume") {
            if (op == "==") {
                res = this->getVolume() == stod(value);
            } else if (op == "!=") {
                res = this->getVolume() != stod(value);
            } else if (op == ">") {
                res = this->getVolume() > stod(value);
            } else if (op == "<") {
                res = this->getVolume() < stod(value);
            } else if (op == ">=") {
                res = this->getVolume() >= stod(value);
            } else if (op == "<=") {
                res = this->getVolume() <= stod(value);
            }
        } else {
            res = false;
        }

        finalRes = finalRes && res;
    }

    return finalRes;
}
