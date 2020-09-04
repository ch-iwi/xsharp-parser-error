# xsharp-parser-error

This Visual Studio 2019 solution is to illustrate a XSharp 2.5.2.0 parser issue in the XSharp VO dialect.

The solution contains two projects:

* VOSDIApp1 - a SDI project using the XSharp VO dialect
* WindowsFormsApplication1 - a WinForms project using the XSharp Core dialect

## Description of Issue

Assigning the Debug property of SentryOptions with type of LOGICAL results in a parser error when using the VO dialect.

`oSentryOptions:Debug := TRUE`

VOSDIApp1 - Start.prg - Line 12 => This line results in the parser error: **Parser: unexpected input ':='**

WindowsFormsApplication1 - Program.prg - Line 18 => This line is **OK**

