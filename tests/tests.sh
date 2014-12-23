#!/usr/bin/env chocomint
# test.sh

#@ name: THIS TEST TITLE IS HERE

###
### IF YOU USE FUNCTIONS, YOU MUST DEFINE BEFORE ALL TESTS.
###
function dummy_func() {
  echo 'out error' 1>&2
  echo 'out stdout'
  return 3
}

true #: status:0 output::None

echo "Hello"
#: stdout:'hello' status!:1

dummy_func  #: stderr:'error' stdout:~'.*std.*'
            #: status:3       status!:0
            #: output::None

sleep 2 #: status:0

for i in 1 2 3
do
  echo $i
  #: stdout:"$i"
  #: stdout:"1"
  #: status!:1
done
