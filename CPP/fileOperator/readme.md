## Stanford Open Course cs106b
### Updated from 2008 to 2017 C++ standards.

Stanford made one year of their "cs106b: Programming Abstractions" course open to the public. The source code within this project is an updated version of the material presented by Julie Zelenski when she taught this course in 2008.

### Setup
- Work was done using Unix(Mac).
- C++ version is: Apple LLVM version 8.1.0 (clang-802.0.42)
- Install Xcode: Version 8.3.3 (8E3004b)
- Install JVM

### Sources
- Course index page: [CS106B Programming Abstractions Course (2008)](https://see.stanford.edu/Course/CS106B)
- Stanford C++ Library: [source code](https://github.com/stepp/stanford-cpp-library). The code within the 'lib' directory of this project is from commit cb777b3.
- Newer [course materials](http://web.stanford.edu/class/cs106b/) for cs106b. Good for helping solidify abstract topics.

### Debugging
- If Xcode doesn't recognize the "example.txt" file
  - In the Xcode (v7.1.1 at the time of writing) [modification: I am using 8.3.3 and comment remains relevant] sidebar, there's an automatically generated folder called "Products". Inside you'll find the executable of your project (assuming you've built your project at least once). Right-click it & choose "Show in Finder". A folder will open in Finder. That's the working directory of your program, & you'll notice it's not actually inside your project's folder.
  - You can have Xcode use a different directory instead. In the top toolbar, on the left side where it shows your project name next to the active build architecture, click on the Project name > Edit Scheme…
  - Then look for an option called "Working Directory" in the sheet that appears. Tick the checkbox & then choose a custom directory. Note: Make sure the "Run" option is the selected one in that sheet's sidebar. [[source: Mahouk's response within Stackoverflow](https://stackoverflow.com/questions/7279100/c-ifstream-on-xcode-where-is-the-default-directory) ]
