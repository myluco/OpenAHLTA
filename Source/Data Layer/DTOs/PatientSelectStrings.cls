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
Attribute VB_Name = "PatientSelectStrings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'--- begin DTO Builder; DTO=PatientSelectStrings
'--- 2/17/2004 6:21:50 PM
'---
'--- NOTE: DO NOT MODIFY THIS CLASS
'
'

Option Explicit

Implements iObjectPersist

Private Const OBJECT_VERSION = "1.0"
Private Const UNIQUE_IDENTIFIER = "PatientSelectStrings"


Private mCol As Collection
Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub


Public Function Add(Optional ByRef o As PatientSelectString = Nothing, Optional ByVal Key As String = "") As PatientSelectString
    On Error Resume Next
    
    If o Is Nothing Then
        Exit Function
    End If

    If LenB(Key) = 0 Then
        mCol.Add o
    Else
        mCol.Add o, Key
    End If
End Function
Private Function iObjectPersist_Copy() As Object
    Dim NewMe As PatientSelectStrings
    Dim Persist As iObjectPersist
    Dim Writer As iWriter
    Dim Reader As iReader

    On Error GoTo ErrHandler
    
    Set NewMe = New PatientSelectStrings
  
    Set Writer = New WriterXML
    iObjectPersist_Persist Writer
  
    Set Reader = New ReaderXML
    Set Persist = NewMe
  
    Reader.DocumentVersion = Persist.Version
    Reader.Contents = Writer.Contents
  
    Persist.Restore Reader
  
    Set iObjectPersist_Copy = NewMe
  
    Set NewMe = Nothing
    Exit Function
ErrHandler:
    Err.Raise Err.Number, "DTOsPatientSelectStrings.iObjectPersist_Persist", Err.Description, Err.HelpFile, Err.HelpContext

End Function
Private Sub iObjectPersist_Persist(ByRef Writer As iWriter)
    Dim i As Long

    With Writer
        .InitHeader UNIQUE_IDENTIFIER, OBJECT_VERSION, mCol.Count
    
        For i = 1 To mCol.Count
            .WriteObject "Item_" & i, mCol.Item(i)
        Next
    End With
End Sub
Private Function iObjectPersist_Restore(ByRef Reader As iReader) As Boolean
    Dim Obj As PatientSelectString
    Dim i As Long
    Dim NumObjs As Long

    On Error GoTo ErrHandler
  
    With Reader
        NumObjs = .CollectionCount
    
        For i = 1 To NumObjs
            Set Obj = New PatientSelectString
            .ReadObject "Item_" & i, Obj
            mCol.Add Obj
      
            Set Obj = Nothing
        Next
    End With

    iObjectPersist_Restore = True
  
    Exit Function
  
ErrHandler:
  
End Function
Private Property Get iObjectPersist_UniqueIdentifier() As String
    iObjectPersist_UniqueIdentifier = UNIQUE_IDENTIFIER
End Property

Private Property Get iObjectPersist_Version() As String
    iObjectPersist_Version = OBJECT_VERSION
End Property
Public Function Count() As Long
    Count = mCol.Count
End Function

Public Function Item(ByVal Key As Variant) As PatientSelectString
Attribute Item.VB_UserMemId = 0
    On Error Resume Next
    Set Item = mCol.Item(Key)
End Function

Public Function NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Function

Public Sub Remove(ByVal Key As Variant)
    On Error Resume Next
    mCol.Remove Key
End Sub
'--- end DTO Builder

