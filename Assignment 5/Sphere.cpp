#include "Sphere.h"

#include <algorithm>
#include <string>

using namespace std;

Sphere::Sphere(string name, double radius) : Shape("sphere") {
    this->name = name;
    this->radius = radius;
}

double Sphere::getRadius() const { return radius; }

double Sphere::getArea() const { return 4 * PI * radius * radius; }

double Sphere::getVolume() const {
    return 4.0 / 3.0 * PI * radius * radius * radius;
}

string Sphere::getName() const { return name; }

string Sphere::getInfo() const {
    ostringstream oss;
    oss << "Sphere: " << name << ", Radius=" << radius << "\n"
        << "\tSurface Area: " << this->getArea()
        << ", Volume: " << this->getVolume();
    return oss.str();
}

bool Sphere::test(const vector<string>& cond) const {
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