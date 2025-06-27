IO.puts("Hello world from Elixir")

# Basic Datatypes in ElixirLS
1             #integer
0x1F          #integer
1.0           #float
true          #boolean
:atom         #atom/symbol
"elixir"      #string
[1, 2, 3]     #list
{1, 2, 3}     #tuple

#basic arithmetics (div and rem functions)
rem(10, 3) #output = 1 (remainder)
div(90, 9) #output = 10


#we have round and trunc functions
round(7.43) #output = 7
round(7.68) #output = 8
trunc(8.3) #output = 8
trunc(8.9) # 8

# datatype checks
is_integer(10) #output == true
is_integer(10.0) #output == false | float

#booleans and nil (3 boolean operators: and, or, not)
true and true #output = true
false or is_boolean(true) #output = true
# and or are short circuit operators. only execute right side if left side is not enough.

