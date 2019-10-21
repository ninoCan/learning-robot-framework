# Robot Framework & Selenium2 

We are going to familiarize with the [RobotFramework](https://robotframework.org/ ) tool for testing
and one of its libraries: [Selenium2](https://github.com/robotframework/Selenium2Library )

## Setting things up

### Robot Framework

Install robotframework but first check if it is among the packages of your disto.
(I have Arch-linux and it wasn't among the official packages, but I could find it in the AUR
packages)
- **Arch**
  
      $ yay -Sa robotframework
- **Ubuntu**
  The robotframework is not among the official repos, but it can be installed with the python
  package manager:
   
        $ pip install robotframework
### Selenium2 libraries

The best way to install it is through the python package manager, but use this
command:

    $ sudo pip --upgrade robotframework-selenium2libraries
This library is a web testing library for Robot Framework that utilizes the Selenium tool
internally. However,  the specific drivers for the browser you want to test should be downloaded
manually in order for it to work properly.
Therefore, choose the [drivers](https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers
) you want to use, beware they are OS specific. Download the `.zit`/`.tar.gz` to any folder and
extract it. 
EG. using the drivers for firefox on linux machine with 64 architecture:
    
    $ wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
    $ tar -xvzf geckodriver-v0.26.0-linux64.tar.gz
Then add it to one of the folders in the `$PATH` variable. If in doubt which folders are there just run: 
    
    $ echo "$PATH"
but among them `/usr/local/lib` it's a good choice:

    $ sudo mv geckodriver /us/local/bin

## Tinkering with Robot Framework

Create a folder for your testing task, and in it touch a `.robot` file.
This file should consist of at most four part:
```robotframework
*** Settings ***

*** Variables ***

*** Test Cases ***

*** Keywords ***
```

In them we are going to call specific keywords (tasks/commands) that we are going to parse to the
robotframework program through the command line command such:

    $ robot <name-of-the-test>.robot
Let's rapidly explore the functions of these sections
### Settings
In this section, we are going to write the documentation and loading the libraries we want to use. 
This is an example of my first `.robot` file:
```robotframework
*** Settings ***
Documentation    This the my first .robot file
...              Line 2 of documentation
Library          SeleniumLibrary
```
The Documentation is telling RF that what come next are going to be the reference. **It is important
that any field is detached from its keyword by at least 2 spaces** (ideally one tab).
The dots specify another line of the documentation. Finally the Library keyword specifies that we
want the `SeleniumLibrary` to be loaded, so that we use the keywords defined in it.

### Variables

In this section we can define variable for later usage. Let's define a page url and the browser we
are going to use:
```robotframework
*** Variables ***
${URL}      https://google.com
${BROWSER}  firefox
```
This can be later called with the full name of them, for instance `${URL}`.

### Cases
This is where we specify Robot Framework _what to do_. The method of employ it's easy:
- define the name of a test. You can use more then one word, and the name of the test should be as
  self-explanatory as possible. It's
  good practise to capitalize the first letter.
- A list of tasks we want to use: tab first and then call the task you want to run. A task's name
  may consists of more than one word, capitalization is again a good practise. As first task, you
  can add documentation for this test by the `[Documentation]`
  - add variables, but remember they need at least two spaces  (a tab preferably) of separation between them and the
    keywords and among them, as well. They need not to
    be the variables defined in the previous section.
    
This are some example tasks:
```robotframework
*** Test Cases ***
MyFirstTest
    Log     Hello world!

 FirstSeleniumTest
    Open Browser  ${URL}  ${BROWSER}
    [Teardown] Close Browser
```
In the first task we just print "Hello world!" to the log file. In the second one, we open firefox
to google and then close the browser.

### Keywords

The keywords in a TEST CASE do not need to be just those contained in the libraries, but we can be
creative and generate new keywords on our own. In this section we can give the directive of what a
keyword-line does based on other primitive keywords.

## Have fun!

Now you should be able to generate your own Robot Framework test suite. Just go ahead and pick some
functions from the [built in](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html ) library and [Selenium2](http://robotframework.org/Selenium2Library/Selenium2Library.html )

