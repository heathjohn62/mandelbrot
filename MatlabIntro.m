% ACM 95a/100a: Introductory Methods of Applied Mathematics for the Physical Sciences
% Self Study  : Introduction to Matlab
%% What is MATLAB?

%{
MATLAB is short for MATrix LABoratory. It is a numerical computation 
environment which provides a suite of tools for computation, visualization,
and more. MATLAB excels at numerical computation.

When to use MATLAB?
(1) if you can afford to buy it, or can get it free (like here at Caltech).
(2) for numerically intensive computations.
(3) for plotting and dealing with data (analisis, visualization).
(4) for faster DEVELOPMENT than C and Fortran.
(5) for faster EXECUTION than most other high level languages.

When not to use MATLAB?
(1) when you have to pay for it.
(2) for symbolic math, if you have access to Mathematica or Maple.
(3) if you want free software, or want to release code that doesn't
require the user to have MATLAB.
(4) if you are doing something serious, like climate modelling, solving 
3D Partial Differential Equations, working with massive datasets, etc.

MATLAB competes with many languages, including:
- Mathematica and Maple  [sybolic math packages]
- MATLAB imitations [FreeMat, Octave, SciLab, xmath]
- C and Fortran   [staples of the high-performance community]
- C++, as well as C# etc.   [modern Object-Oriented languages]
- java and python   [also modern Object-Oriented languages]
- perl, bash and other shells   [mainly data manipulation]
- S and R   [statistics languages]

In one way or another, most of MATLAB's competitors can do what MATLAB 
does. Here are some of MATLAB's advantages:

(1) the language is intuitive and mathematically expressive =>
    MATLAB is rather fast to learn
(2) the HELP menu is fantastic
(3) MATLAB is an industry standard (much like Microsoft Word) =>
    the web is full of MATLAB resources.
(4) MATLAB matrix manipulation algorithms (esp. for sparse matrices) are 
state of the art

and disadvantages:

(1) for complex tasks (especially ones which require for loops), MATLAB
can sometimes be slower than hand-coded C or Fortran.
(2) MATLAB is expensive 
%}

%% Getting started
%{
Elements of the Matlab desktop: 

  - command window, command prompt (command line interpreter)
  - history window (history features are also available at the 
    command prompt: <up> key, tab completion, drag-n-drop)
  - workspace, variable editor (and plot window)
  - current directory and file details editor
  - the current folder selector, which help determines search path (make
    sure you're consistent about which directory you work in)
  - the editor

All of these windows can be re-arranged (Explore: Home>Layout)
%}

%{ 
What is this file?

This is an example of a script "m-file". Script m-files contain sequences 
of commands that are executed in order. It is very similar to using the 
command line, but much more convenient.

All script files have the 
extension ".m". This file is saved as "MatlabIntro.m". MATLAB also automatically 
makes backup files, called either "MatlabIntro.asv" (windows) or "MatlabIntro.m~" 
(unix/linux). You can ignore these, or turn them off in the Preferences.

%}

%{
Comments: 
 
Everything written here is a comment, text that is  ignored by MATLAB. 
Use comments to document your code!  
There are two ways to write comments: either comment a single line with 
"%", or use block comments to comment several lines, using 
%{ followedd by %}. See this file for examples. Note that you cannot have 
ANYTHING on the line that starts with "%{". By default, the editor puts 
comments in green (you can change this). 
%}

% Remark: to execute a subset of lines, you can highlight them and use 
% "Evaluate Selection" 

%% The Help System
%{ 
 Help shows the format(s) for using a command and directs you to related
 commands; without any arguments, it gives you a hyperlinked list of
 topics to find help on; with a topic as an argument, it gives you a list
 of subtopics
%}

help
help ode45
   
% doc is like help, except it comes up in a different window, and may
% include more details

doc ode45

% lookfor is used when you don't know what command you want; it does 
% something like a keyword search through the documentation.

lookfor ode

% demo gives video guides and example code
demo

%% More sources of help
%{
    The internet has about 10,000 MATLAB tutorials.  
    Googling "How to ... in Matlab" will almost certainly give an answer. 
%}
%% MATLAB as a Calculator
% standard commands to start a session:
clc       % clears the Command Window screen
clear     % clears all variable definitions
close all % close all figures (if any)

3 + 5  % displays result

3 + 5; % suppresses display of result (but the calculation is done)

3 +        5 % white space doesn't matter where it shouldn't

% Wrapping lines
3 + ...
5

% as long as i or j hasn't been assigned to as a regular variable, MATLAB
% interprets them as sqrt(-1)
i^2
j^2
exp(pi*i)
 

% If you set
i=1
% then i is 1 now, but if you clear its value:
clear i
% it is sqrt(-1) again
disp(i)
% Remark: to clear more than one variable, do NOT separate the variable
% names with a comma -- just uses spaces, e.g.
% >> clear x y z

% MATLAB respects the standard order of operations
3 + 5/2 
(3 + 5)/2

% Remark: comments can start ANYWHERE in a line of code
% but you cannot "undo" a comment on the same line, e.g. % comment % code

%% Variables
% MATLAB doesn't require you to declare variables, and is case sensitive.
x=4
disp(X) % gives error (disp(X) asks to show the value of X)
% Variable name must start with a upper case or lower case letter and be
% followed by letters, digits and underscores ONLY. Variable name cannot be
% the same as a built in MATLAB keyword (use iskeyword to check)

a = 2
b = 2
a^b
% MATLAB stores the result of the last calculation as a variable named 'ans'
ans+1

x = 8; a+x % the semicolon suppresses output AND allows
           % to add a second command.
           
% who and whos give information on the variables currently defined
% you can also see this information in the 'workspace' tab, which
% lists all the global data you have in memory
who 
whos
           
%% Vectors and Matrices
% Matrices are the basic datatype in Matlab
clc; clear;
x = [1, 2, 3] % row vector: separate elements in the same row with commas
y = [1 2 3]   % row vector: spaces also work to separate elements in a row
z = [1; 2; 3] % column vector: separate elements in the same column with ;

z = 1:20    % can use the range notation to generate row vectors
z = 1:2:20  % the "2" means that we go from 1 to 20 in increments of 2
z = 20:-2:0
z = [0:.1:1] % the array brackets are optional

% a 3-by-3 matrix: 
A = [1, 2, 3; 4, 5, 6; 7, 8, 9] 
%   the spaces and commas separate columns
%   and the semicolons separate rows

A*x  % invalid! Lust like in linear algebra, quantities need to have 
     % the correct dimensions to make a valid MATLAB expression
x*A  % this works: row vector times matrix is a row vector     

A*x' % x' is a (conjugate) transposition of x (.' for real transpose) 

% Some operations are "matrix" operations, and others  are "component-wise" 
% aka "element-wise".

B=A*A   % this is matrix  multiplication
C=A.*A  % this works component-wise, c_ij=(a_ij)*(a_ij)

B=A^2     % this is matrix multiplication, e.g. "A*A"
C=A.^A    % this is element-wise, e.g. "A.*A"

B=exp(A)      % this is element-wise
C=expm(A)     % this is an inherent matrix operation

% use A' to take the conjugate transpose of a matrix, and .' to take the
% real transpose; e.g.: 

A = [0 i; -i, 0]
A.'
A'

% You can convert row (column) vectors to column (row) vectors using ' or .'
x = [1, 5, 6, 7, 7]'

%% Vectorization

close all;  % closes all figures
clear;      % clears the workspace
clc;        % clears the Command Window

%{
MATLAB is optimized for operations involving matrices and vectors.  
"Vectorization" is the process of revising loop-based, scalar-oriented 
code to use MATLAB matrix and vector operations.
Vectorizing your code is worthwhile for several reasons:
(1) Appearance: Vectorized mathematical code appears more like the 
mathematical expressions found in textbooks, making the code easier to understand.
(2) Less Error Prone: Without loops, vectorized code is often shorter. 
Fewer lines of code mean fewer opportunities to introduce programming errors.
(3) Performance: Vectorized code often runs much faster than the corresponding 
code containing loops.

"Vectorize!" is one of the mantras of MATLAB programming.
%}

% Simple example: here is a non-vectoriaed code
i = 0;
for t = 0:.01:10   % meant for t = 0, 0.01, 0.02, ..., 10
    i = i + 1;
    y(i) = sin(t);
end
% Here is a vectorized version of the same code:
t = 0:.01:10;
y = sin(t);

% Strategy: matrix thinking + built-in functions

%% Further Reading 
% Complex Variables with Applications and MATALB Tutorials
% https://www.math.wustl.edu/~sk/books/test.pdf
% Solving ODEs in MATLAB
% http://www.math.tamu.edu/undergraduate/research/REU/comp/matode.pdf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% The END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


