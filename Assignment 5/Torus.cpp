#include "Torus.h"

#include <algorithm>
#include <string>

using namespace std;

Torus::Torus(string name, double majorRadius, double minorRadius)
    : Shape("torus") {
    this->name = name;
    this->majorRadius = majorRadius;
    this->minorRadius = minorRadius;
}

double Torus::getMajorRadius() const { return majorRadius; }

double Torus::getMinorRadius() const { return minorRadius; }

double Torus::getArea() const {
    return 4 * PI * PI * majorRadius * minorRadius;
}

double Torus::getVolume() const {
    return 2 * PI * PI * majorRadius * minorRadius * minorRadius;
}

string Torus::getName() const { return name; }

string Torus::getInfo() const {
    ostringstream oss;
    oss << "Torus: " << name << ", Small Radius=" << minorRadius
        << ", Big Radius=" << majorRadius << "\n"
        << "\tSurface Area: " << this->getArea()
        << ", Volume: " << this->getVolume();
    return oss.str();
}

bool Torus::test(const vector<string>& cond) const {
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
