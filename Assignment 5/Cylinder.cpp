#include "Cylinder.h"

#include <algorithm>
#include <string>

using namespace std;

Cylinder::Cylinder(string name, double radius, double height)
    : Shape("cylinder") {
    this->name = name;
    this->radius = radius;
    this->height = height;
}

double Cylinder::getRadius() const { return radius; }

double Cylinder::getHeight() const { return height; }

double Cylinder::getArea() const { return 2 * PI * radius * (radius + height); }

double Cylinder::getVolume() const { return PI * radius * radius * height; }

string Cylinder::getName() const { return name; }

string Cylinder::getInfo() const {
    ostringstream oss;
    oss << "Cylinder: " << name << ", Radius=" << radius
        << ", Height=" << height << "\n"
        << "\tSurface Area: " << this->getArea()
        << ", Volume: " << this->getVolume();
    return oss.str();
}

bool Cylinder::test(const vector<string>& cond) const {
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