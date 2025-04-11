| fName shape args f r name shapes line eachLine type tokens flag |
args := Smalltalk arguments

(args size < 1) ifTrue: [
	'Usage: shape.st sphere.st cylinder.st torus.st box.st -f main.st shape_file' displayNl.
	ObjectMemory quit.
].

fName := args at: 1.
f := FileStream open: fName mode: FileStream read ifFail: [
	('Unable to open ', fName displayString, ' for reading') displayNl.
	ObjectMemory quit.
].

shapes := OrderedCollection new.

setOfCommands := Set new.
setOfCommands add: 'count'.
setOfCommands add: 'print'.
setOfCommands add: 'min'.
setOfCommands add: 'max'.
setOfCommands add: 'total'.
setOfCommands add: 'avg'.
setOfCommands add: 'quit'.
setOfCommands add: 'help'.

[f atEnd] whileFalse: [
	| l w h |
	line := f nextLine.
	tokens := line substrings.
	type := tokens at: 2.

	(type asString = 'sphere') ifTrue: [
		eachLine := line substrings.
		name := eachLine at: 1.
		r := (eachLine at: 3) asNumber.
		shape := Sphere new: name radius: r.
		shapes add: shape.	
	].
	(type asString = 'box') ifTrue: [
		eachLine := line substrings.
		name := eachLine at: 1.
		l := (eachLine at: 3) asNumber.
		w := (eachLine at: 4) asNumber.
		h := (eachLine at: 5) asNumber.
		shape := Box new: name length: l width: w height: h.
		shapes add: shape.
	].
	(type asString = 'cylinder') ifTrue: [
		eachLine := line substrings.
		name := eachLine at: 1.
		r := (eachLine at: 3) asNumber.
		h := (eachLine at: 4) asNumber.
		shape := Cylinder new: name radius: r height: h.
		shapes add: shape.
	].
	(type asString = 'torus') ifTrue: [
		| smallR bigR |
		eachLine := line substrings.
		name := eachLine at: 1.
		smallR := (eachLine at: 3) asNumber.
		bigR := (eachLine at: 4) asNumber.
		shape := Torus new: name smallRadius: smallR bigRadius: bigR.
		shapes add: shape.
	].
].

f close.

flag := true.
[flag] whileTrue: [
	| input index str num cons count i con printList minVol minArea newShapes maxVol maxArea totalVol totalArea |

	'Enter a command: ' display.
	input := stdin nextLine.
	index := input findFirst: [:char | char isDigit].
	(index = 0) ifTrue: [
		str := input.
		num := 0.
	] ifFalse: [
		str := input copyFrom: 1 to: index - 1.
		num := (input copyFrom: index to: input size) asNumber.
	].

	(str = 'quit') ifTrue: [
		flag := false.
		" ObjectMemory quit. "
	].

	(str = 'help') ifTrue: [
		'		count
		*** print the number of all shapes
		countN
		*** print the number of all shapes that satisfy all N conditions specified below
		*** for example: count3
		print
		*** print all shapes
		printN
		*** print all shapes that satisfy all N conditions specified below
		*** for example: print4
		min
		*** find the minimum surface area and volume of all shapes
		minN
		*** find the minimum surface area and volume of all shapes that satisfy all N conditions specified below
		*** for example: min2
		max
		*** find the maximum surface area and volume of all shapes
		maxN
		*** find the maximum surface area and volume of all shapes that satisfy all N conditions specified below
		*** for example: max3
		total
		*** find the tatal surface area and volume of all shapes
		totalN
		*** find the total surface area and volume of all shapes that satisfy all N conditions specified below
		*** for example: total4
		avg
		*** find the average surface area and volume of all shapes
		avgN
		*** find the average surface area and volume of all shapes that satisfy all N conditions specified below
		*** for example: avg2
		quit
		*** quit this program
		help
		*** print this list

		Each condition shall be entered in one line and of the following format:
		volume

		The valid operators:
		==
		!=
		>=
		<=
		>
		<' displayNl.
		('') displayNl.
	].
	
	(str = 'count') ifTrue: [
		cons := OrderedCollection new.
		count := 0.

		(num = 0) ifTrue: [
			('There are ', (shapes size) displayString, ' shapes.') displayNl.
			('') displayNl.
		] ifFalse: [
			cons := OrderedCollection new.
			
			i := 1.
			[i <= num] whileTrue: [
				('Enter test condition #', i displayString, ': ') display.
				con := stdin nextLine.
				cons add: con.
				i := i + 1.
			].
			
			shapes do: [:element |
				(element test: cons) ifTrue: [
					count := count + 1.
				].
			].

			('There are ', count displayString, ' shapes.') displayNl.
			('') displayNl.
		].
	].

	(str = 'print') ifTrue: [
		(num = 0) ifTrue: [
			shapes do: [:element |
				(element getInfo) displayNl.
			].
			('') displayNl.
		] ifFalse: [
			cons := OrderedCollection new.
			printList := OrderedCollection new.

			i := 1.
			[i <= num asNumber] whileTrue: [
				('Enter test condition #', i displayString, ': ') display.
				con := stdin nextLine.
				cons add: con.
				i := i + 1.
			].

			shapes do: [:element |
				(element test: cons) ifTrue: [
					printList add: element.
				].
			].

			(0 = printList size) ifTrue: [
				('No shapes satisfy the conditions.') displayNl.
				('') displayNl.
			] ifFalse: [
				printList do: [:element |
					(element getInfo) displayNl.
				].
				('') displayNl.
			].
		].
	].

	(str = 'min') ifTrue: [
		(num = 0) ifTrue: [
			minVol := ((shapes at: 1) getVolume) asFloat.
			minArea := ((shapes at: 1) getArea) asFloat.

			shapes do: [:element |
				(((element getVolume) asFloat) < minVol) ifTrue: [
					minVol := ((element getVolume) asFloat).
				].
				(((element getArea) asFloat) < minArea) ifTrue: [
					minArea := ((element getArea) asFloat). 	
				].
			].

			('min(surface area)=', minArea displayString) displayNl.
			('min(volume)=', minVol displayString) displayNl.
			('') displayNl.
		] ifFalse: [
			cons := OrderedCollection new.
			newShapes := OrderedCollection new.
			i := 1.
			[i <= num] whileTrue: [
				('Enter test condition #', i displayString, ': ') display.
				con := stdin nextLine.
				cons add: con.
				i := i + 1.
			].

			shapes do: [:element |
				(element test: cons) ifTrue: [
					newShapes add: element.		
				].
			].

			(0 = newShapes size) ifTrue: [
				('No shapes satisfy the conditions.') displayNl.
				('') displayNl.																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
			] ifFalse: [
				minVol := ((newShapes at: 1) getVolume) asFloat.
				minArea := ((newShapes at: 1) getArea) asFloat.

				newShapes do: [:element |
					(((element getVolume) asFloat) < minVol) ifTrue: [
						minVol := ((element getVolume) asFloat).
					].
					(((element getArea) asFloat) < minArea) ifTrue: [
						minArea := ((element getArea) asFloat).
					].
				].

				('min(surface area)=', minArea displayString) displayNl.
				('min(volume)=', minVol displayString) displayNl.
				('') displayNl.
			].
		].
	].

	(str = 'max') ifTrue: [
		cons := OrderedCollection new.
		(num = 0) ifTrue: [
			maxVol := ((shapes at: 1) getVolume) asFloat.
			maxArea := ((shapes at: 1) getArea) asFloat.

			shapes do: [:element |
				(((element getVolume) asFloat) > maxVol) ifTrue: [
					maxVol := ((element getVolume) asFloat).
				].
				(((element getArea) asFloat) > maxArea) ifTrue: [
					maxArea := ((element getArea) asFloat).
				].
			].

			('max(surface area)=', maxArea displayString) displayNl.
			('max(volume)=', maxVol displayString) displayNl.
			('') displayNl.
		] ifFalse: [
			cons := OrderedCollection new.
			newShapes := OrderedCollection new.
			i := 1.
			[i <= num] whileTrue: [
				('Enter test condition #', i displayString, ': ') display.
				con := stdin nextLine.
				cons add: con.
				i := i + 1.
			].

			shapes do: [:element |
				(element test: cons) ifTrue: [
					newShapes add: element.
				].
			].

			(0 = newShapes size) ifTrue: [
				('No shapes satisfy the conditions.') displayNl.
				('') displayNl.
			] ifFalse: [
				maxVol := ((newShapes at: 1) getVolume) asFloat.
				maxArea := ((newShapes at: 1) getArea) asFloat.

				newShapes do: [:element |
					(((element getVolume) asFloat) > maxVol) ifTrue: [
						maxVol := ((element getVolume) asFloat).
					].
					(((element getArea) asFloat) > maxArea) ifTrue: [
						maxArea := ((element getArea) asFloat).
					].
				].

				('max(surface area)=', maxArea displayString) displayNl.
				('max(volume)=', maxVol displayString) displayNl.
				('') displayNl.
			].
		].
	].

	(str = 'total' or: [str = 'avg']) ifTrue: [
		(num = 0) ifTrue: [
			totalVol := 0.
			totalArea := 0.
			shapes do: [:element |
				totalVol := (totalVol + ((element getVolume) asFloat)).
				totalArea := (totalArea + ((element getArea) asFloat)).
			].

			(str = 'total') ifTrue: [
				('total(surface area)=', totalArea displayString) displayNl.
				('total(volume)=', totalVol displayString) displayNl.
				('') displayNl.
			] ifFalse: [
				('avg(surface area)=', (totalArea / shapes size) displayString) displayNl.
				('avg(volume)=', (totalVol / shapes size) displayString) displayNl.
				('') displayNl.
			].
		] ifFalse: [
			newShapes := OrderedCollection new.
			cons := OrderedCollection new.

			i := 1.
			[i <= num] whileTrue: [
				('Enter test condition #', i displayString, ': ') display.
				con := stdin nextLine.
				cons add: con.
				i := i + 1.
			].

			shapes do: [:element |
				(element test: cons) ifTrue: [
					newShapes add: element.
				]
			].

			(0 = newShapes size) ifTrue: [
				('No shapes satisfy the conditions.') displayNl.
				('') displayNl.
			] ifFalse: [
				totalVol := 0.
				totalArea := 0.

				newShapes do: [:element |
					totalVol := (totalVol + ((element getVolume) asFloat)).
					totalArea := (totalArea + ((element getArea) asFloat)).
				].

				(str = 'total') ifTrue: [
					('total(surface area)=', totalArea displayString) displayNl.
					('total(volume)=', totalVol displayString) displayNl.
					('') displayNl.
				] ifFalse: [
					('avg(surface area)=', (totalArea / newShapes size) displayString) displayNl.
					('avg(volume)=', (totalVol / newShapes size) displayString) displayNl.
					('') displayNl.
				].
			].
		].
	].

	"Invalid command"
	(setOfCommands includes: str) ifFalse: [
		(str, ': invalid action.') displayNl.
		('') displayNl.

		('Valid commands: ') display.
		setOfCommands do: [:each |
			(each displayString, ' ') display.
		].

		('') displayNl.
		('') displayNl.
		('Enter help for help.') displayNl.
		('') displayNl.
	].
].

ObjectMemory quit.