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

class Box : public Shape {
    private:
        double length;
        double width;
        double height;
        string name;
        string shapeType = "box";
    public:
        Box(string name, double length, double width, double height);
        double getLength() const;
        double getWidth() const;
        double getHeight() const;
        double getArea() const override;
        double getVolume() const override;
        bool test(const vector<string>& cond) const override;
        string getInfo() const override;
        string getName() const;
};