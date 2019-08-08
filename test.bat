@Echo off
Setlocal EnableDelayedExpansion

Goto :Main

:Main
            rem change folder path here=============================================
            cd "\\Fsclus02\aofd$\DigitalAccountOpening\CKYC"
            rem ====================================================================
	  
           For /f "tokens=1-3 delims=- " %%a in ('date /t') do (set fileDate=%%b-%%a-%%c	
								)
	   md "!fileDate!"
           for %%g in (*.jpg, *.pdf) do (           
					if exist "!fileDate!" (
                                                move "%%g" "!fileDate!"
                                    		)Else (
                                                md !fileDate!
                                                move "%%g" "!fileDate!")
						
                                   					 
					)
	    pushd !fileDate!

	    for %%h in (*.*) do (
                        for /f "delims=_ tokens=1" %%i in ("%%h") do (
                                    set File_name=%%i
                                    if exist "!File_name!" (
                                                move "%%h" "!File_name!"
                                    )Else (
                                                md !File_name!
                                                move "%%h" "!File_name!"
						
                                    )
				   
                        )
            )
          popd
			
Goto :Eof
