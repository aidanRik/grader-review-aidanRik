CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# check if file is right 
if [ -f "student-submission/ListExamples.java" ]; then
    echo 'This is the correct file' 
else
    echo 'This is not the right type of file! Please submit again'
    exit 1
fi

# copy the files over to grading-area
cp -r student-submission/*.java grading-area/
cp -r TestListExamples.java grading-area/
cp -r lib grading-area/

# switch over and compile 
cd grading-area
javaC -cp $CPATH *.java 
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

# check for failures 
if [ $? -eq 0 ]; then 
    echo 'All tests passed'
else 
    echo 'Some tests failed!'
    echo 'Check above to find out why'
fi




 

 

