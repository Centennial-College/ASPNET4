﻿Imports System.Data.SqlClient
Imports System.Configuration

Partial Class EmployeeDirectory
    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
  ' Define data objects
  Dim conn As SqlConnection
  Dim comm As SqlCommand
  Dim reader As SqlDataReader
  ' Read the connection string from Web.config
  Dim connectionString As String = _
      ConfigurationManager.ConnectionStrings( _
      "Dorknozzle").ConnectionString
  ' Initialize connection
  conn = New SqlConnection(connectionString)
  ' Create command
  comm = New SqlCommand( _
      "SELECT EmployeeID, Name, Username FROM Employees", _
      conn)
  ' Enclose database code in Try-Catch-Finally
  Try
    ' Open the connection
    conn.Open()
    ' Execute the command
    reader = comm.ExecuteReader()
    ' Bind the reader to the DataList
    employeesList.DataSource = reader
    employeesList.DataBind()
    ' Close the reader
    reader.Close()
  Finally
    ' Close the connection
    conn.Close()
  End Try
End Sub

Protected Sub employeesList_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles employeesList.ItemCommand
' Which button was clicked?
  If e.CommandName = "MoreDetailsPlease" Then
    ' Find the Literal control in the DataList item
    Dim li As Literal
    li = e.Item.FindControl("extraDetailsLiteral")
    ' Add content to the Literal control
    li.Text = "Employee ID: <strong>" & e.CommandArgument & _
        "</strong><br />"
  End If
End Sub
End Class
