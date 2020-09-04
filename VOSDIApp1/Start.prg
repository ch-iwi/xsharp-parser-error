USING Sentry
USING System

[STAThread];
FUNCTION Start() AS INT
	LOCAL oXApp AS XApp
    
	LOCAL oSentryOptions AS SentryOptions 
	oSentryOptions := SentryOptions{}
	oSentryOptions:Dsn := Dsn{"https://sentrydsnhere"}
	//the following line causes a compiler parser error
    oSentryOptions:Debug := TRUE
    
    BEGIN USING VAR oSentry := SentrySdk:Init(oSentryOptions)
		TRY        
			oXApp := XApp{}
			oXApp:Start()        
		CATCH oException AS Exception
			SentrySdk:CaptureMessage("Test Message")
			SentrySdk:CaptureException(oException)
			ErrorDialog(oException)
		END TRY
    END USING
RETURN 0

CLASS XApp INHERIT App
METHOD Start() 
	LOCAL oMainWindow AS StandardSDIWindow
	
    //THROW Exception{"Test Exception!"}
	
    oMainWindow := StandardSDIWindow{SELF}
	oMainWindow:Show(SHOWCENTERED)
	SELF:Exec()	
RETURN SELF	

END CLASS
