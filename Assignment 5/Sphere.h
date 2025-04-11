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

class Sphere : public Shape {
    private:
        double radius;
        string name;
        string shapeType = "sphere";
    public:
        Sphere(string name, double radius);
        double getRadius() const;
        double getArea() const override;
        double getVolume() const override;
        bool test(const vector<string>& cond) const override;
        string getInfo() const override;
        string getName() const;
};