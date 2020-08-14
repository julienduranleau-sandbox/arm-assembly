clear

mkdir -p bin

rm bin/$1 2> /dev/null
rm bin/$1.o 2> /dev/null

as -g -o bin/$1.o $1.s && gcc -g -o bin/$1 bin/$1.o
