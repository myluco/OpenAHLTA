'***************************************************************************************
'
'  Copyright (c) 2007-2012 Northrop Grumman Corporation
'
'  Licensed by Tricare Management Activity under license from the Copyright owner.
'
'  This text file must be included in all Derivative Works of the licensed Source Code.
'
'***************************************************************************************

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsXMLPersist"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Property Get ExamXML() As clsExamXML
    
    If goExamXML Is Nothing Then
        Set goExamXML = New clsExamXML
    End If
    
    Set ExamXML = goExamXML

End Property

Public Function TerminateObjects()
    
    If Not goExamXML Is Nothing Then
        goExamXML.TerminateObjects
    End If
    
    Set goExamXML = Nothing
    
End Function


