
#!/bin/bash

cd ..
sphinx-build -b html source build
make html
xdg-open build/index.html 
PID=$!
sleep 1
kill $PID

