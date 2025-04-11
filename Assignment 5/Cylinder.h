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

class Cylinder : public Shape {
    private:
        double radius;
        double height;
        string name;
        string shapeType = "cylinder";
    public:
        Cylinder(string name, double radius, double height);
        double getRadius() const;
        double getHeight() const;
        double getArea() const override;
        double getVolume() const override;
        bool test(const vector<string>& cond) const override;
        string getInfo() const override;
        string getName() const;
};