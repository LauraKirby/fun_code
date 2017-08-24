//
//  main.cpp
//  fileOperator
//
//  Created by Laura Kirby on 8/22/17.
//  Copyright © 2017 LK. All rights reserved.
//
//  The source code below is an updated version material presented in
//  Stanford CS106B Programming Abstractions Course (2008), Lecture 6
//  by Julie Zelenski
//  C++ version: Apple LLVM version 8.1.0 (clang-802.0.42)
//  Sources:
//    Youtube:
//      - https://www.youtube.com/watch?v=eYTDzvlAZMM&index=6&list=PLFE6E58F856038C69
//    Stanford public course:
//      - https://see.stanford.edu/Course/CS106B
//      - https://see.stanford.edu/materials/icspacs106b/Lecture06.pdf
//      - https://see.stanford.edu/materials/icspacs106b/Lecture6code.txt

#include <fstream>
#include <iostream>
#include <iomanip>
#include <ctype.h> // for isalpha
#include "console.h"
#include "hashmap.h"
#include "map.h"
#include "simpio.h"
#include "strlib.h"
#include "filelib.h"
#include "set.h"
#include "random.h"
#include <unistd.h>
using namespace std;

void ReadFile(ifstream &in, Map<string, int> &m)

{
    string line;

    while (true) {
        string word;
        in >> word;
        if (in.fail()) break;
        if (m.containsKey(word))
            m[word]++;
        else
            m[word] = 1;
    }
    cout << "num unique words " << m.size() << endl;
}


void ReadFileTwo(ifstream &in, Map<string, int> &mapTwo)
{
    while (true) {
        string word;
        in >> word;
        if (in.fail()) break;
        if (mapTwo.containsKey(word))
            mapTwo[word]++;
        else
            mapTwo[word] = 1;
    }
    Map<string, int>::iterator itr = mapTwo.begin();
    string max;
    int maxCount = 0;
    while (itr != mapTwo.end()) {
        string key = *itr;
        if (mapTwo[key] > maxCount) {
            max = key;
            maxCount = mapTwo[key];
        }
        ++itr;
    }
    cout << "Max is '" << max << "' = " << maxCount << endl;
}

void TestRandom()
{
    Set<int> seen;
    while (true) {
        int num = randomInteger(1, 100);
        if (seen.contains(num)) break;
        seen.add(num);
    }
    Set<int>::iterator itr = seen.begin();
    while (itr != seen.end()){
        cout << "number seen: " << *itr << endl;
        ++itr;
    }
}

int main()
{
    Map<string, int> counts;
    ifstream in ("example2.txt");
    ReadFile(in, counts);
    ReadFileTwo(in, counts);
    TestRandom();
    char * dir = getcwd(NULL, 0); // Platform-dependent, see reference link below
    printf("Current dir: %s", dir);
    return 0;
}
