# Bash Cheat Sheet
A **Bash script** is a text file that contains *programming statements that execute commands* that are part of the host computer’s operating system.
Typically *system administrators and programmers use Bash scripts to avoid having to repetitively execute tasks manually in a terminal*.

## Runing a Bash Script
There are two ways to run a Bash script. The first way is to execute it as a parameter of a direct call to the bash executable binary, like so:
`bash myscript`
The second way to use the chmod command to change the permissions of the bash script to make it a standalone executable, like so:
```
chmod +x ./script
./script
```

## Using a Shebang Header
Unlike a *binary executable file which knows how to interact with the computer’s operating system directly*, a *Bash script, which is always text based, requires another program to run its commands.*
This other program is called an **interpreter**. The interpreter that runs a Bash script is, as the name implies, **bash**. However, in other cases, a bash script
can be run by *another interpreter that’s installed on the host computer*. An example of another interpreter is **sh** .
*The way a Bash script lets the operating system know which interpreter to use* is according to a declaration made at the first line of the script.
This first line declaration is called a **script header**. It is also called a shebang. A shebang starts with the characters **#!**
` #!/usr/bin/bash`
Another form of a shebang is as follows:
`#!/usr/env bash`

## Variables
Using variables is a critical factor for programming Bash scripts. The following sections describe various aspects of working with variables under Bash.
### Variable Declaration
You declare a variable in a bash script like so **VARIABLE_NAME=<value>** WHERE <value> is the value assigned to the variable.
Then, to reference the variable, put the $ symbol before the variable name being referenced, like so:
```
#!/usr/bin/env bash
MSG="Hello World"
echo "$MSG " # Hello World
```

### String manipulation using parameter expansion
Parameter expansion a technique to *get the value from the referenced entity such as a variable in a Linux script or an environment variable* according to a piece of processing logic.
A variable is processed by enclosing the variable name within the **${ }** characters. The processing logic is defined by characters that follow the variable name.
the variable named MSG, the statement **${MSG^^}** turns all lowercase characters in the variable MSG to **uppercase**.
```
MSG="aBcDeFg"
echo ${MSG^^}
#returns ABCDEFG
```
And the statement **${MSG,,}** turns all uppercase characters in the variable MSG to **lowercase**.
```
MSG="aBcDeFg"
echo ${MSG,,}
#returns abcdef
```

#### Word replacement
```
MSG="Say hi to Chris and Sidney"
echo ${MSG//Chris/Billy}
#returns Say hi to Billy and Sidney
```
#### Character replacement using regular expressions
Replace all alphabetic characters with the character X but leave the numerals alone X
```
MSG="I need 10"
echo ${MSG//[a-zA-Z]/X}
#returns X XXXX 10
```
#### Extracting substrings
Use the **:** symbol to get the substring of all the characters after the starting at position 4 :
```
MSG="The Rolling Stones"
echo ${MSG:4}
#returns Rolling Stones
```
Use the **#** symbol to get the substring after the characters The starting from the left side of the string.
```
MSG="The Rolling Stones"
echo ${MSG#The}
#returns Rolling Stones
```
Use the **%** symbol to get the substring before the characters Rolling Stones starting the right side of the string.
```
MSG="The Rolling Stones"
echo ${MSG%Rolling Stones}
#returns The
```

### Case conversion
Use the **^** symbol to convert the first character in a string to uppercase.
```
MSG="aBcDeFg"
echo ${MSG^}
#returns ABcDeFg
```
Use the **^^** symbols to convert the all lowercase characters in a string to uppercase.
```
MSG="aBcDeFg"
echo ${MSG^^}
#returns ABCDEFG
```
Use the **,** symbol to convert the first character in a string to lowercase.
```
MSG="TuVwXyZ"
echo ${MSG,}
#returns tuVwXyZ
```
Use the **,,** symbols to convert all characters in a string to lowercase.
```
MSG="TuVwXyZ"
echo ${MSG,,}
#returns tuvwxyz
```

## Collections
The following sections describe how to *group data as a collection in a bash script*. Bash supports two types of
collections. One type is an array. The other type is a map.
An **array** is a collection in which elements of the collection are accessed according to a number.
A **map** is a collection in which elements of the collection a key value
### Arrays
Creating an array
`array=('first' 'second' 'third')`
The following creates an array with three elements and assigns the array to the variable named array.
#### Adding an element to an array
The following uses the **+=** operator to add an element with the value Soto to the array named my_array.
`array+=('fourth')`
#### Removing an element to an array
The following uses the **unset** keyword to remove the fourth element from the array named array at index 3.
`unset array 3`
#### Viewing data in an array
The following uses an *index number to view the data* in the first element of the array.
`echo ${my_array[0]}`
#### Getting the number of elements in an array
The following uses the **#** and **@** symbols to get a count of the number of elements in the array.
`echo ${#names[@]} # 3`

### Maps
In Bash, a map is a collection of elements that are organized as key-value pairs.
Another way to think of a map is as a named associative array.
To access an element in a map you reference its key.
#### Creating a map
You create a map using the command declare **-A <map_name>** 
WHERE the option -A indicates that the variable represents an associative array, which is that same as a map
```
declare -A map
map[first]="1"
map[second]="2"
map[third]="3"
map[fourth]="4"
```	
Use the **!** and **@** symbols to show all the keys in the map named score.
`echo ${!map[@]}`
The following example demonstrates using the **unset** keyword to delete the element identified by the key third
`unset map[third] # Delete third entry`
Use the **@** symbol to show all the values in the map.
`echo ${map[@]} # show all the values`
The following example demonstrates calling the value of the element associated with the key edson. edon
`echo ${map[second]} # show the value of second: 2`
Use the **#** and **@** symbols to get a count of the number of elements in the map
`echo ${#map[@]} # show the number of elements in the map: 3`















