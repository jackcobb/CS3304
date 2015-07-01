/*----- Facts -----*/
course('Algorithms', 'MWF 9:00-11:00 a.m.', 'McB 209').
course('Models & Analysis', 'MWF 9:00-11:00 a.m.', 'McB 211').
course('Data Structures', 'MWF 3:00-5:00 p.m.', 'McB 305').
course('Operating Systems', 'TTH 9:00-11:00 a.m.', 'McB 306').
course('Programming in C', 'MWF 1:00-3:00 p.m.', 'McB 209').
course('Artificial Intelligence', 'TTH 3:00-5:00 p.m.', 'McB 311').
course('Computer Architecture', 'TTH 1:00-3:00 p.m.', 'NEB 2300').
course('Models of Computation', 'TTH 11:00-1:00 p.m.', 'McB 204').
course('Discrete Math', 'TTH 3:00-5:00 p.m.', 'McB 204').
course('Information Retrieval', 'MWF 3:00-5:00 p.m.', 'McB 205').
course('Software Engineering', 'MWF 11:00-1:00 p.m.', 'McB 213').
course('Computer Vision', 'MWF 1:00-3:00 p.m.', 'NEB 2182').
course('OS Tools', 'TTH 1:00-3:00 p.m.', 'McB 217').
course('Programming Lang.', 'TTH 9:00-11:00 a.m.', 'McB 311').
course('Programming in Java', 'TTH 11:00-1:00 p.m.', 'McB 204').

courseteacher('Dr. Smith', 'Algorithms').
courseteacher('Dr. Jones', 'Models & Analysis').
courseteacher('Dr. Ray', 'Data Structures').
courseteacher('Dr. Smith', 'Operating Systems').
courseteacher('Dr. Ray', 'Programming in C').
courseteacher('Dr. Jones', 'Artificial Intelligence').
courseteacher('Dr. Gibson', 'Computer Architecture').
courseteacher('Dr. Smith', 'Models of Computation').
courseteacher('Dr. Smith', 'Discrete Math').
courseteacher('Dr. Jones', 'Information Retrieval').
courseteacher('Dr. Gibson', 'Software Engineering').
courseteacher('Dr. Jones', 'Computer Vision').
courseteacher('Dr. Gibson', 'OS Tools').
courseteacher('Dr. Ray', 'Programming Lang.').
courseteacher('Dr. Ray', 'Programming in Java').

type('Algorithms', 'Theory').
type('Models & Analysis', 'Theory').
type('Data Structures', 'Core').
type('Operating Systems', 'Core').
type('Programming in C', 'Prog.').
type('Artificial Intelligence', 'Elective').
type('Computer Architecture', 'Core').
type('Models of Computation', 'Theory').
type('Discrete Math', 'Theory').
type('Information Retrieval', 'Elective').
type('Software Engineering', 'Elective').
type('Computer Vision', 'Elective').
type('OS Tools', 'Core').
type('Programming Lang.', 'Prog.').
type('Programming in Java', 'Prog.').

taking('Michael', 'Algorithms').
taking('Michael', 'Software Engineering').
taking('Michael', 'Programming Lang.').

taking('JoAnne', 'Artificial Intelligence').
taking('JoAnne', 'Information Retrieval').
taking('JoAnne', 'Programming Lang.').

taking('Bill', 'Algorithms').
taking('Bill', 'Artificial Intelligence').
taking('Bill', 'Computer Vision').

/*----- Rules -----*/
teaches(X, Y):- courseteacher(X, Y).

schedule(Teacher, Course, Time, Room):- courseteacher(Teacher, Course), course(Course, Time, Room).

sametime(Teacher1, Teacher2, Time):- courseteacher(Teacher1, CX), courseteacher(Teacher2, CY), course(CX, Time, _), course(CY, Time, _).

coursesincommon(Student1, Student2, Course):- taking(Student1, Course), taking(Student2, Course).

takingtype(Student, Coursetype):- taking(Student, Course), type(Course, Coursetype).

schedulingconflict(Type, Room, Lecturer, CourseA, CourseB, Time) :-
	(Type = 'room') -> course(CourseA, Time, Room),
	course(CourseB, Time, Room),
	CourseA \= CourseB;
	(Type = 'teacher') -> schedule(Lecturer, CourseA, Time, _),
	schedule(Lecturer, CourseB, Time, _),
	CourseA \= CourseB.
