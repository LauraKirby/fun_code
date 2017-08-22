//
//  main.cpp
//  fileOperator
//
//  Created by Laura Kirby on 8/22/17.
//  Copyright © 2017 LK. All rights reserved.
//

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

int main()
{
    Map<string, int> counts;
    ifstream in ("example.txt");
    ReadFile(in, counts);
    return 0;
}
