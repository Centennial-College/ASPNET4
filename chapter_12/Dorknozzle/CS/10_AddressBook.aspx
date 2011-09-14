﻿<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs" Inherits="AddressBook" Title="Dorknozzle Address Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Address Book</h1>
  <p>
  <asp:LinkButton id="addEmployeeButton" runat="server"
    Text="Add New Employee" />
  </p>
  <asp:GridView id="grid" runat="server" AutoGenerateColumns="False" 
      AllowPaging="True" AllowSorting="True" DataKeyNames="EmployeeID" 
      DataSourceID="employeesDataSource" PageSize="3" onsorting="grid_Sorting">
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
      <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
      <asp:BoundField DataField="MobilePhone" HeaderText="Mobile Phone" />
      <asp:ButtonField CommandName="Select" Text="Select" />
    </Columns>
  </asp:GridView>
  <br />
  <asp:DetailsView id="employeeDetails" runat="server" AutoGenerateRows="False" 
    AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
    AutoGenerateInsertButton="True" DataKeyNames="EmployeeID" 
    DataSourceID="employeeDataSource" 
    onitemdeleted="employeeDetails_ItemDeleted" 
    oniteminserted="employeeDetails_ItemInserted" 
    onitemupdated="employeeDetails_ItemUpdated">
    <Fields>
      <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
        InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
      <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" 
        SortExpression="DepartmentID" />
      <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
      <asp:BoundField DataField="Password" HeaderText="Password" 
        SortExpression="Password" />
      <asp:BoundField DataField="Username" HeaderText="Username" 
        SortExpression="Username" />
      <asp:BoundField DataField="Address" HeaderText="Address" 
        SortExpression="Address" />
      <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
      <asp:BoundField DataField="MobilePhone" HeaderText="MobilePhone" 
        SortExpression="MobilePhone" />
      <asp:BoundField DataField="Extension" HeaderText="Extension" 
        SortExpression="Extension" />
      <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" 
        SortExpression="HomePhone" />
      <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
      <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
    </Fields>
    <HeaderTemplate>
      <%#Eval("Name") == null ? "Adding New Employee" :
        Eval("Name")%>
    </HeaderTemplate>
  </asp:DetailsView>
  <asp:SqlDataSource ID="employeesDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" 
    SelectCommand="SELECT [EmployeeID], [Name], [City], [MobilePhone] FROM [Employees] ORDER BY [Name]"></asp:SqlDataSource>
  <asp:SqlDataSource ID="employeeDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" 
    DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" 
    InsertCommand="INSERT INTO [Employees] ([DepartmentID], [Name], [Password], [Username], [Address], [City], [MobilePhone], [Extension], [HomePhone], [Zip], [State]) VALUES (@DepartmentID, @Name, @Password, @Username, @Address, @City, @MobilePhone, @Extension, @HomePhone, @Zip, @State)" 
    SelectCommand="SELECT [EmployeeID], [DepartmentID], [Name], [Password], [Username], [Address], [City], [MobilePhone], [Extension], [HomePhone], [Zip], [State] FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)" 
    UpdateCommand="UPDATE [Employees] SET [DepartmentID] = @DepartmentID, [Name] = @Name, [Password] = @Password, [Username] = @Username, [Address] = @Address, [City] = @City, [MobilePhone] = @MobilePhone, [Extension] = @Extension, [HomePhone] = @HomePhone, [Zip] = @Zip, [State] = @State WHERE [EmployeeID] = @EmployeeID">
    <SelectParameters>
      <asp:ControlParameter ControlID="grid" Name="EmployeeID" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="EmployeeID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="DepartmentID" Type="Int32" />
      <asp:Parameter Name="Name" Type="String" />
      <asp:Parameter Name="Password" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="MobilePhone" Type="String" />
      <asp:Parameter Name="Extension" Type="String" />
      <asp:Parameter Name="HomePhone" Type="String" />
      <asp:Parameter Name="Zip" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="EmployeeID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="DepartmentID" Type="Int32" />
      <asp:Parameter Name="Name" Type="String" />
      <asp:Parameter Name="Password" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="MobilePhone" Type="String" />
      <asp:Parameter Name="Extension" Type="String" />
      <asp:Parameter Name="HomePhone" Type="String" />
      <asp:Parameter Name="Zip" Type="String" />
      <asp:Parameter Name="State" Type="String" />
    </InsertParameters>
  </asp:SqlDataSource>
</asp:Content>

