USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text
USING System.Windows.Forms
Using Sentry

USING WindowsFormsApplication1

BEGIN NAMESPACE WindowsFormsApplication1

[STAThread] ;
	FUNCTION Start() AS VOID
        
    LOCAL oSentryOptions AS SentryOptions 
	oSentryOptions := SentryOptions{}
	oSentryOptions:Dsn := Dsn{"https://examplePublicKey@o0.ingest.sentry.io/0"}
	oSentryOptions:Debug := TRUE
    
    BEGIN USING VAR oSentry := SentrySdk.Init(oSentryOptions)
        Application.SetUnhandledExceptionMode(UnhandledExceptionMode.ThrowException)
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault( FALSE )
        Application.Run( Form1{} )
    END USING
   
    RETURN
	
END NAMESPACE


