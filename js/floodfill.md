minIndex = 0
maxRowIndex = 2
maxColumnIndex = 2


step 1: row: 1, column: 1
add(1)
    newLocationValue === startLocationValue
    newLocationValue = something different

      if: row > minIndex, 1 > 0, move up
        true
          add(2): dfs(1-1,1)
              row: 0, column: 1
                newLocationValue === startLocationValue
                    newLocationValue = something different

                    (2)if: row > minIndex, 0 > 0, move up: 
                      false
                    (2)if: row < maxRowIndex, 0 < 2, move down
                        true
                            add(3, total count 2): dfs(0+1, 1)
                                row: 1, column: 1
                                newLocationValue != startLocationValue
                            remove(3, total count 2): dfs(0+1, 1) 
                      
                            finish(2)

                    (2)if: column > minIndex, 1 > 0
                        true
                          add(4, total count 3): dfs(0,1-1)
                            row: 0, column: 0
                            newLocationValue === startLocationValue
                              if up, false
                              if down, false
                              if left, false
                              if column < maxColumnIndex, 0 < 2
                                  true
                                  add(5, total count 4)
                                    row: 0, column 1
                                    newLocationValue != startLocationValue
                                    
                                  remove(5, total count 3): dfs(0,1)

                                  finish(4)
                              no more if statements
                                remove(4, total count 2)

                                finish(2)

                  (2)if: column < maxColumnIndex, 1 < 2
                      true
                        add(6, total count 3), dfs(0,2)
                        newLocationValue === startLocationValue

                        taking a break here



    if: column > minIndex, 1 > 1, move left
        true
          call dfs (0, 1-1)

step 3: 
  if: newLocationValue === startLocationValue
    false

step 4: 
  remove dfs(1,1) from the stack




-----------
stack: 
------------
  1. dfs(1,1), row: 1, column: 1
  2. dfs(0,1), row: 0, column: 1
  3. dfs(1,1), row: 1, column: 1 (4. remove)


    
