#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>
#include <iomanip>
#include <limits>
#include <cctype>

#include "Shape.h"

using namespace std;

class Torus : public Shape {
    private:
        double majorRadius, minorRadius;
        string name;
        string shapeType = "torus";
    public:
        Torus(string name, double majorRadius, double minorRadius);
        double getMajorRadius() const;
        double getMinorRadius() const;
        double getArea() const override;
        double getVolume() const override;
        bool test(const vector<string>& cond) const override;
        string getInfo() const override;
        string getName() const;
};