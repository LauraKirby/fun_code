# Tower of Hanoi

# n = disks
# source = source pole, with initial disks
# aux = auxiliary poli as an itermediat resting place
# dst = destination

def tower_of_hanoi(list)
moves = 0
  while !list.empty?
    moves += 1
    puts "move: #{moves}"
    n, source, destination, auxiliary = list.pop
    puts "n #{n}"
    puts "source #{source}"
    puts "destination #{destination}"
    puts "auxiliary #{auxiliary}"
    if n == 1
      puts "move disk from #{source} to #{destination}"
    else
      # push in an array which represents
      list.push [n-1, auxiliary, destination, source]
      list.push [1, source, destination, auxiliary]
      list.push [n-1, source, auxiliary, destination]
      print "list: #{list}"
    end
  end
end

list = [[3, "a", "c", "b"]]

# print list
tower_of_hanoi(list)