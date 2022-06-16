REM make_user %CREDENTIALS% -group="Engineering" 
REM make_user %CREDENTIALS% -group="Engineering" -role="Designer" 
make_user %CREDENTIALS% -group="Engineering" -role="Librarian" 
make_user %CREDENTIALS% -group="Engineering" -role="System Engineer" 
make_user %CREDENTIALS% -group="Engineering" -role="PM" 
make_user %CREDENTIALS% -group="Engineering" -role="Test" 

make_user %CREDENTIALS% -group="Manufacturing" 
make_user %CREDENTIALS% -group="Manufacturing" -role="Engineer" 
make_user %CREDENTIALS% -group="Manufacturing" -role="Planner" 

make_user %CREDENTIALS% -group="Quality" 
make_user %CREDENTIALS% -group="Quality" -role="Engineer" 

make_user %CREDENTIALS% -group="Consumer" 
make_user %CREDENTIALS% -group="Consumer" -role="Viewer" 

make_user %CREDENTIALS% -group="Checker" 
make_user %CREDENTIALS% -group="Checker" -role="Engineering" 
make_user %CREDENTIALS% -group="Checker" -role="Manufacturing" 
make_user %CREDENTIALS% -group="Checker" -role="Quality" 
make_user %CREDENTIALS% -group="Checker" -role="CM" 