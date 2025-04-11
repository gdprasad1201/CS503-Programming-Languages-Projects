Object subclass: Shape [
    | name |

    Shape class >> new: shapeName [
        <category: 'instance creation'>
        | r |
        r := super new.
        r init: shapeName.
        ^r
    ]

    init: shapeName [
        <category: 'initialization'>
        name := shapeName
    ]

    Shape >> getName [
        ^name
    ]

    Shape >> setName: shapeName [
        name := shapeName
    ]

    Shape >> getArea [
        self subclassResponsibility
    ]

    Shape >> getVolume [
        self subclassResponsibility
    ]

    Shape >> test: cond [
        self subclassResponsibility
    ]

    Shape >> getInfo [
        self subclassResponsibility
    ]
].