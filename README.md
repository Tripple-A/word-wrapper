## Description
This is a ruby program written to perform word wrapping. It contains a class called `Wrapper` which contains a single static method called `wrap`. It accepts two arguments `string` and `column_number` representing the string to be wrapped and how long a line should be.

## Installation of This Repository
Clone the Repository

```Shell
your@pc:~$ git clone https://github.com/Tripple-A/word-wrapper.git
your@pc:~$ cd word-wrapper
```

Install all dependencies

```Shell
your@pc:~$ bundle install
```

## Dependencies
- Sorbet: This is used for type checking
- RSpec: This is used for testing 


## To Test
```
rspec wrap.spec.rb
```

## To play around
```
your@pc:~$ irb
your@pc:~$ load './wrap.rb'
```

## A sneak peek
![Some examples](/wrapper.png)

