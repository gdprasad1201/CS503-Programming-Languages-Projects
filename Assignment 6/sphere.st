Shape subclass: Sphere [
	| radius |

	Sphere class >> new: sphereName radius: sphereRadius [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init: sphereName radius: sphereRadius.
		^r
	]

	init: sphereName radius: sphereRadius [
		<category: 'initalization'>
		super init: sphereName.
		radius := sphereRadius.
	]

	Sphere >> getArea [
		^ (4.00 * Float pi * (radius asNumber squared))
	]

	Sphere >> getVolume [
		^ ((4.00 / 3.00) * Float pi * (radius asNumber squared) * radius)
	]

	Sphere >> getInfo [
		| ss |
		ss := WriteStream on: (String new: 200).
		ss nextPutAll: 'Sphere: ', self getName, ', Radius=', (radius asFloat) asString.
		ss nl.
		ss tab.
		ss nextPutAll: ' Surface Area: ', (self getArea) asString, ', Volume: ', (self getVolume) asString.
		^ (ss contents)
	]

	Sphere >> test: cond [
		| type op value shape subs floatVal i |
		shape := 'sphere'.

		i:= 1.
		[ i <= cond size ] whileTrue: [
			| subs |
			subs := (cond at: i) substrings.
			type := subs at: 1.
			op := subs at: 2. 
			value := subs at: 3.
                        
			(type = 'type') ifTrue: [
				(op = '==') ifTrue: [
					value ~= 'sphere' ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					value = 'sphere' ifTrue: [
						^ false
					].
				]. 
				(op = '>=') ifTrue: [
					shape < value ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					shape > value ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					shape <= value ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					shape >= value ifTrue: [
						^ false
					].
				].
			].
			(type = 'area') ifTrue: [
                | area |
				area := (self getArea) asNumber.
				floatVal := value asNumber.

				(op = '==') ifTrue: [
					area ~= floatVal ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					area = floatVal ifTrue: [
						^ false
					].
				].
				(op = '>=') ifTrue: [
					area < floatVal ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					area > floatVal ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					area <= floatVal ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					area >= floatVal ifTrue: [
						^ false
					].
				].
			].
			(type = 'volume') ifTrue: [
				| vol |
				vol := (self getVolume) asNumber.
				floatVal := value asNumber.

				(op = '==') ifTrue: [
					vol ~= floatVal ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					vol = floatVal ifTrue: [
						^ false
					].
				].
				(op = '>=') ifTrue: [
					vol < floatVal ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					vol > floatVal ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					vol <= floatVal ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					vol >= floatVal ifTrue: [
						^ false
					].
				].
            ].

			i := i + 1.
	    ].

		^ true
    ]
]
